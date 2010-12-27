class Publication < ActiveRecord::Base
  has_many :pages
  belongs_to :editor
  has_one :bitly
  
  before_save :set_uuid

  state_machine :state, :initial => :created do
    # - Locked is a user allowed state (i.e. after publishing, the publication can be
    #   locked to prevent further editing). 
    # - Hidden is a system state hiding the published because (for example) of copyright
    #   violations of the document. Only certain (i.e. system admins) can unlock a publication.
    [:created, :editing, :published, :locked, :hidden, :deleted].each { |stat| state stat }

    after_transition(:to => :deleted)  { |obj| obj.send(:set_timestamp_field, :deleted_at) }
    after_transition(:to => :locked)   { |obj| obj.send(:set_timestamp_field, :locked_at) }
    after_transition(:to => :published){ |obj| obj.send(:set_timestamp_field, :published_at) }

    event :publish do
      transition any - [:deleted,:hidden] => :published, :if => :queue_for_pdf_generation
    end
    
    # called by the callback controller
    event :begin_edit do
      transition :created => :editing
    end
  end

  class << self
    def generate_itemid
      UUIDTools::UUID.timestamp_create.to_s.gsub(/-/,'')
    end
  end

  def find_or_create_by_page_number(page_number)
    page = Page.find_by_publication_id_and_number(self.id, page_number)
    self.pages << (page = Page.create(:number => page_number)) if page.nil?
    page
  end
  
  protected 

  def queue_for_pdf_generation
    ## TODO a document is ready to be generated as pdf, so queue it to be generated.
    true
  end
  
  def set_uuid
    self.uuid = Publication.generate_itemid if self.uuid.nil?
  end

  def set_timestamp_field(field_name)
    send("#{field_name}=", Time.now)
    save
  end
end
