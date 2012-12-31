module VehiclesHelper

  def detailed_vehicle_name(vehicle=@vehicle)
    "#{vehicle.code} #{vehicle.vehicle_type} #{vehicle.vehicle_class}"
  end

  def detailed_vehicle_model(vehicle=@vehicle)
  	"#{vehicle.model_year} model #{vehicle.brand} #{vehicle.model}"
  end

  def vehicle_buying_price(vehicle=@vehicle)
  	"#{vehicle.vehicle_price} #{vehicle.price_curr}"
  end
end
