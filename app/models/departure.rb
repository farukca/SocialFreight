class Departure < ActiveRecord::Base

  acts_as_gmappable :process_geocoding => false, :validation => false

  belongs_to :loading
  belongs_to :country
  belongs_to :city
  belongs_to :sender, :class_name => "Company", :foreign_key => "sender_id"
  belongs_to :loader, :class_name => "Company", :foreign_key => "loader_id"
  belongs_to :customofficer, :class_name => "Company", :foreign_key => "customofficer_id"
  belongs_to :load_place, :class_name => "Place", :foreign_key => "load_place_id"

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
