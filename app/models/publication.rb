class Publication < ActiveRecord::Base
  has_many :pages
  has_many :bitlies
  belongs_to :user
  
  belongs_to :original, :class_name => "Publication"
  has_many :copies, :foreign_key => :original_id, :class_name => "Publication"
  
  before_save :set_uuid

  scope :not_deleted, where("state != 'deleted'")
  scope :for_user, lambda { |user| where( "user_id = ?", user.id) }
  
  include PageElementHelpers::ColorSupport
  
  state_machine :state, :initial => :created do
    # - Locked is a user allowed state (i.e. after publishing, the publication can be
    #   locked to prevent further editing). 
    # - Hidden is a system state hiding the published because (for example) of copyright
    #   violations of the document. Only certain (i.e. system admins) users can unhide 
    #   a publication.
    [:created, :editing, :published, :locked, :hidden, :deleted].each { |stat| state stat }

    after_transition(:to => :deleted)  { |obj| obj.send(:set_timestamp_field, :deleted_at) }
    after_transition(:to => :locked)   { |obj| obj.send(:set_timestamp_field, :locked_at) }
    after_transition(:to => :published){ |obj| obj.send(:set_timestamp_field, :published_at) }

    event :publish do
      # because we can't pass parameters to events, we can't generate bitly url here
      # so that we can't prevent the transition on bitly failure.
      transition [:created,:editing] => :published #, :if => :queue_pdf_generation
    end
    
    event :bitly_failed do
      transition :published => :editing
    end
    
    # called by the callback controller
    event :begin_edit do
      transition [:created, :editing] => :editing
      transition [:published] => :published
    end
    
    event :forget_it do
      transition [:created,:editing,:deleted] => :deleted
    end
    
    event :hide_it do
      transition [:published,:hidden] => :hidden
    end

    event :lock_it do
      transition any => :locked
    end

    event :show_it do
      transition [:hidden] => [:published], :if => :has_bitly_url?
      transition [:hidden] => [:editing], :if => :has_no_bitly_url?
    end
    
    event :undelete_it do
      transition [:deleted] => [:published], :if => :has_bitly_url?
      transition [:deleted] => [:editing], :if => :has_no_bitly_url?
    end
  end

  def has_bitly_url?
    bitlies.count > 0
  end
  def has_no_bitly_url? ; !has_bitly_url? ; end
  
  class << self
    def generate_uuid
      # last 12 chars are always the same - the mac address.
      UUIDTools::UUID.timestamp_create.to_s.gsub(/-/,'').gsub(/.{12}$/,'')
    end

    # in this case id_str can either be a base62 encode value or a UUID value 
    # (this has exactly 20 hexadecimal characters)
    def find_by_params_id!(id_str, opts = {})
      Publication.find_by_uuid!(case id_str 
                                when /^[a-f0-9]{20}$/ then id_str
                                when /^[a-zA-Z0-9]{5,19}$/
                                  id_str.base62_decode.to_s(16).downcase.rjust(20,'0')
                                else Publication.find(id_str).uuid
                                end, opts)
    end
    
    def create_copy(original_publication, new_owner)
      pub_copy          = original_publication.clone
      pub_copy.original = original_publication
      pub_copy.uuid     = nil
      pub_copy.save
      pub_copy.update_attributes({ :state        => "created",
                                   :user         => new_owner,
                                   :name         => "Copy of %s" % original_publication.name,
                                   :published_at => nil,
                                   :updated_at   => nil,
                                   :created_at   => Time.now,
                                   :locked_at    => nil,
                                   :deleted_at   => nil})
      pub_copy.pages = original_publication.pages.map do |orig_page| 
        (new_page = orig_page.clone).save
        new_page.page_elements = orig_page.page_elements.map { |a| a.clone }
        new_page
      end
      pub_copy
    end
  end
  
  def create_copy(new_owner)
    Publication.create_copy(self, new_owner)
  end
  
  # check whether we can display this publication
  def viewable?
    published? || created? || editing?
  end
  
  def to_pdf
    ::PdfGeneration.render_publication(self)
  end
  
  def bitly_url
    # TODO does not consider the format, this could also be pdf.
    @bitly_url || (@bitly_url = (bitlies.first && bitlies.first.short_url))
  end
  
  def to_json_for_editor
    to_json(:include => { :pages => { 
                :except => [:created_at, :updated_at], 
                :include => { :page_elements => { 
                    :except => [:data, :created_at, :updated_at]}}}})
  end
  
  def uuid_base62
    uuid.to_i(16).base62_encode
  end
  
  def generate_bitly(server_url, format)
    Bitly.for_publication(self, server_url, format)
  end

  def is_continous?
    extra_data["continous"].to_i == 1
  end

  def has_shadow?
    extra_data["shadow"].to_i == 1
  end
  
  def snap_grid_width
    extra_data["snap_grid_width"]
  end

  def bg_color_parts
    retrieve_colors_from_extra_data(extra_data)
  end
  
  def extra_data
    JSON.parse(data || ('{ "red": 221, "blue": 221, "green": 221, "alpha": 1, ' +
                        '"snap_grid_width": 0, "continous" : 0, "shadow" : 1}'))
  end
  
  protected

  def set_uuid
    self.uuid = Publication.generate_uuid if self.uuid.nil?
  end

  def set_timestamp_field(field_name)
    send("#{field_name}=", Time.now)
    save
  end
end
