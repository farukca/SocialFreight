module ArrivalsHelper

	def post_trans_label(arrival=@arrival)
    t("defaults.vocabulary.yes") if arrival.post_trans?
	end

	def arrivals_list_table(arrivals=@arrivals, options={})
		content = content_tag :div, class: "row-fluid", id: "arrivals_list_div" do
			table_for arrivals, html: {class: "table table-bordered table-condensed", id: "arrivals_list_table"} do
				column title: t("operations.label.unload_date"), html: { th: { class: "span1" }  } do |arrival|
          arrival.unload_date.strftime("%d/%m/%Y") if arrival.unload_date
				end
			  column title: t("defaults.label.unload_country"), html: { th: { class: "span2" }  } do |arrival|
			  	country_name(arrival.country_id)
			  end
			  column :unload_city, title: t("defaults.label.unload_city"), html: { th: { class: "span2" } }
			  column :unload_place, title: t("defaults.label.unload_place"), html: { th: { class: "span2" } }
			  column title: t("operations.label.post_trans"), html: { th: { class: "span1" }  } do |arrival|
          post_trans_label(arrival)
        end
			  column title: t("defaults.label.delivery_date"), html: { th: { class: "span1" }  } do |arrival|
          arrival.delivery_date.strftime("%d/%m/%Y") if arrival.delivery_date
			  end
			  #column title: "", html: { th: { class: "span1" } } do |arrival|
			  #	image_tag user_mini_avatar(arrival.user), class: "img-circle", title: user_name(arrival.user)
			  #end
			  column title: "", html: { th: { class: "span1" } } do |arrival|
			  	concat link_to t("defaults.link.edit"), edit_arrival_path(arrival) unless options[:hide_edit_link]
			  	concat "|"
			  	concat link_to t("defaults.link.destroy"), arrival, method: :delete, data: {confirm: t("defaults.messages.destroy_confirm") } if options[:show_delete_link]
			  end
			end
		end

		content <<	(content_tag :div, class: "pagination" do
			paginate arrivals
		end if options[:show_pagination])

		content.html_safe
	end

end
