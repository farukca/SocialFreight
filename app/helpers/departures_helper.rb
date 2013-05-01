module DeparturesHelper

  def pre_trans_label(departure=@departure)
  	t("defaults.vocabulary.yes") if departure.pre_trans?
  end

	def departures_list_table(departures=@departures, options={})
		content = content_tag :div, class: "row-fluid", id: "departures_list_div" do
			table_for departures, html: {class: "table table-bordered table-condensed", id: "departures_list_table"} do
				column title: t("operations.label.load_date"), html: { th: { class: "span1" }  } do |departure|
          departure.load_date.strftime("%d/%m/%Y") if departure.load_date
				end
			  column title: t("defaults.label.load_country"), html: { th: { class: "span2" }  } do |departure|
			  	country_name(departure.country_id)
			  end
			  column :load_city, title: t("defaults.label.load_city"), html: { th: { class: "span2" } }
			  column :load_place, title: t("defaults.label.load_place"), html: { th: { class: "span2" } }
			  column title: t("operations.label.pre_trans"), html: { th: { class: "span1" }  } do |departure|
          pre_trans_label(departure)
        end
			  column title: t("defaults.label.pickup_date"), html: { th: { class: "span1" }  } do |departure|
          departure.pickup_date.strftime("%d/%m/%Y") if departure.pickup_date
			  end
			  #column title: "", html: { th: { class: "span1" } } do |departure|
			  #	image_tag user_mini_avatar(departure.user), class: "img-circle", title: user_name(departure.user)
			  #end
			  column title: "", html: { th: { class: "span1" } } do |departure|
			  	concat link_to t("defaults.link.edit"), edit_departure_path(departure) unless options[:hide_edit_link]
			  	concat "|"
			  	concat link_to t("defaults.link.destroy"), departure, method: :delete, data: {confirm: t("defaults.messages.destroy_confirm") } if options[:show_delete_link]
			  end
			end
		end

		content <<	(content_tag :div, class: "pagination" do
			paginate departures
		end if options[:show_pagination])

		content.html_safe
	end

end