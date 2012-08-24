class Cost < ActiveRecord::Base

  belongs_to :owner, class_name: "Person", foreign_key: "owner_id"
  belongs_to :patron
  belongs_to :costable, polymorphic: true
  belongs_to :country
  belongs_to :city
  
  mount_uploader :cost_file, DocumentUploader

  attr_accessible :cost_source, :cost_type, :owner_id, :operation, :costable_type, :costable_id, :costable_reference, 
                  :branch_id, :cost_price, :cost_vat, :curr_rate, :description, :document_date, :document_no, 
                  :local_cost_price, :local_price_vat, :owner_id, :price_curr, :settlement_curr, :settlement_flag, 
                  :settlement_price, :truck, :user_id, :vehicle, :country_id, :city_id, 
                  :cost_firm, :cost_taxno, :cost_taxoffice, :cost_file

  validates_presence_of :document_date
  validates_presence_of :cost_type
  validates_presence_of :cost_source
  validates_presence_of :user_id
  validates_presence_of :patron_id

end
