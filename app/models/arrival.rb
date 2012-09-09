class Arrival < ActiveRecord::Base

  acts_as_gmappable :process_geocoding => false, :validation => false

  belongs_to :loading
  belongs_to :country
  belongs_to :city
  belongs_to :consignee, :class_name => "Company", :foreign_key => "consignee_id"
  belongs_to :deliver, :class_name => "Company", :foreign_key => "deliver_id"
  belongs_to :notify, :class_name => "Company", :foreign_key => "notify_id"
  belongs_to :notify2, :class_name => "Company", :foreign_key => "notify2_id"
  belongs_to :customofficer, :class_name => "Company", :foreign_key => "customofficer_id"
  #belongs_to :unload_place, :class_name => "Place", :foreign_key => "unload_place_id"

  has_many :packages, as: :packed, dependent: :destroy
  accepts_nested_attributes_for :packages

  validate :loading_id, :presence => true

  def gmaps4rails_address
    "#{self.address}, #{self.district}, #{self.city.name}, #{self.country.name}"
  end
  
end
