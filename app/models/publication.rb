class Publication < ActiveRecord::Base
  has_many :pages
  has_many :bitlies
  belongs_to :user
  
  before_save :set_uuid

  scope :not_deleted, where("state != 'deleted'")
  scope :for_user, lambda { |user| where( "user_id = ?", user.id) }
  
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
      transition any - [:locked,:deleted,:hidden,:published] => :published #, :if => :queue_pdf_generation
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
      transition any - [:deleted,:hidden,:published] => :deleted
    end
  end

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
    @bitly_url || (@bitly_url = bitlies.first.short_url)
  end
  
  def find_or_create_by_page_number(page_number)
    page = Page.find_by_publication_id_and_number(self.id, page_number)
    self.pages << (page = Page.create(:number => page_number)) if page.nil?
    page
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

  protected

  def set_uuid
    self.uuid = Publication.generate_uuid if self.uuid.nil?
  end

  def set_timestamp_field(field_name)
    send("#{field_name}=", Time.now)
    save
  end
end
