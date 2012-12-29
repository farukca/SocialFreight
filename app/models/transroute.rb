class Transroute < ActiveRecord::Base
  
  ROUTE_TYPES = %w["airport" "seaport" "station" "roadroute" "depot"]

  belongs_to :transport

  attr_accessible :arrival_date, :departure_date, :route_city, :route_country, :route_id, 
                  :route_name, :route_type, :transport_id, :notes

  default_scope { where(patron_id: Patron.current_id) }

end
