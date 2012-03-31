class Arrival < ActiveRecord::Base

  acts_as_gmappable :process_geocoding => false, :validation => false

  belongs_to :loading
  belongs_to :country
  belongs_to :city
  

  def gmaps4rails_address
    "#{self.address}, #{self.district}, #{self.city.name}, #{self.country.name}"
  end
  
end
