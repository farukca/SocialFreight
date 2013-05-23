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

  def transport_vessels(transport=@transport)
    "#{transport.vessel} #{transport.truck}"
  end

  def transports_list_table(transports=@transports, options={})
    content = content_tag :div, class: "row-fluid", id: "transports_list_div" do
      table_for transports, html: {class: "table table-bordered table-condensed", id: "transports_list_table"} do
        column title: t("operations.label.vessel"), html: { th: { class: "span2" }  } do |transport|
          link_to transport_vessels(transport), transport_path(transport)
        end
        column :voyage, title: t("operations.label.voyage"), html: { th: { class: "span1" } }
        column :departure_date, title: t("operations.label.departure_date"), html: { th: { class: "span1" } }
        column :dep_place, title: t("operations.label.departure_place"), html: { th: { class: "span2" } }
        column :arrival_date, title: t("operations.label.arrival_date"), html: { th: { class: "span1" } }
        column :arv_place, title: t("operations.label.arrival_place"), html: { th: { class: "span2" } }
        column :driver_name, title: t("operations.label.driver"), html: { th: { class: "span2" } }

        column title: "", html: { th: { class: "span1" } } do |transport|
          concat link_to t("defaults.link.edit"), edit_transport_path(transport) unless options[:hide_edit_link]
          concat "|"
          concat link_to t("defaults.link.destroy"), transport, method: :delete, data: {confirm: t("defaults.messages.destroy_confirm") } if options[:show_delete_link]
        end
      end
    end
  end

end