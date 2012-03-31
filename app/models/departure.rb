class Departure < ActiveRecord::Base

  acts_as_gmappable :process_geocoding => false, :validation => false

  belongs_to :loading
  belongs_to :country
  belongs_to :city

  def gmaps4rails_address
    "#{self.address}, #{self.district}, #{self.city.name}, #{self.country.name}"
  end

  #def get_coordinates
  #  if self.departure_address.present?
  #    self.departure_location = Gmaps4rails.geocode(gmaps4rails_address_departure).first
  #  end
  #  if self.arrival_address.present?
  #    self.arrival_location   = Gmaps4rails.geocode(gmaps4rails_address).first
  #  end
  #end
    
end
