module TransportsHelper

  def transport_freight_price(transport=@transport)
  	"#{number_to_currency(transport.freight_price, precision: 2)} #{transport.freight_curr}"
  end

  def transport_waybill_info(transport=@transport)
  	"#{transport.waybill_no}-#{transport.waybill_date}"
  end

  def transport_departure(transport=@transport)
  	"#{transport.departure_date} #{transport.departure_hour}-#{transport.dep_place} #{transport.dep_city}/#{transport.dep_country_id}"
  end

  def transport_arrival(transport=@transport)
  	"#{transport.arrival_date} #{transport.arrival_hour}-#{transport.arv_place} #{transport.arv_city}/#{transport.arv_country_id}"
  end

end
