class Rental < ActiveRecord::Base
  attr_accessible :company_id, :finish_date, :notes, :price_curr, :rent_price, :rent_status, :rent_type, :start_date, :vehicle, :vehicle_type
end
