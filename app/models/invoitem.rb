class Invoitem < ActiveRecord::Base

  belongs_to :user
  belongs_to :company
  belongs_to :invoitem_owner, polymorphic: true

  attr_accessible :branch_id, :company_id, :credit_debit, :curr_rate, :description, :unit_name, :unit_number, :unit_price, 
                  :invoice_id, :invoice_name, :item_price, :item_vat, :price_curr, :local_curr, :local_price, :local_vat, 
                  :operation, :service, :status, :vat_rate, :invoitem_owner_id, :invoitem_owner_type

  validates_presence_of :unit_name
  validates_presence_of :unit_number
  validates_presence_of :unit_price
  validates_presence_of :item_price
  validates_presence_of :item_vat
  validates_presence_of :company_id
  validates_presence_of :branch_id
  validates_presence_of :credit_debit
  validates_presence_of :price_curr
  validates_presence_of :local_curr
  
  default_scope { where(patron_id: Patron.current_id) }
end
