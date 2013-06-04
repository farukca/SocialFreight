class Document < ActiveRecord::Base

  belongs_to :user
  belongs_to :documented, polymorphic: true, counter_cache: true, touch: true

  mount_uploader :document_file, DocumentUploader

  attr_accessible :document_date, :document_no, :document_type, :operation, :page_number, :country_id, :city_id,
                  :operation, :documented_type, :documented_id, :owner_reference, :due_date, :status, :document_file, :description

  #validates_presence_of :document_date
  validates_presence_of :document_type
  validates_presence_of :user_id
  
  default_scope { where(patron_id: Patron.current_id) }

  def to_s
  	document_type7
  end
end
