module CostsHelper

	def costs_list_table(costs=@costs, options={})
		content = content_tag :div, class: "row-fluid", id: "costs_list_div" do
			table_for costs, html: {class: "table table-bordered table-condensed", id: "costs_list_table"} do
			  column title: t("costs.label.name"), html: { th: { class: "span2" }  } do |cost|
			  	link_to cost.cost_type, cost_path(cost)
			  end
			  column title: t("defaults.label.fax"), html: { th: { class: "span3" } } do |cost|
			  	link_to person_name(cost.staff), person_path(cost.staff)
			  end
			  column title: t("defaults.label.website"), html: { th: { class: "span3" } } do |cost|
			  	print_price(cost.cost_price, cost.price_curr)
			  end
			  column :document_date, title: "Masraf Tarihi", html: { th: { class: "span1" } }
			  column :document_no, title: "Belge No", html: { th: { class: "span1" } }
			  column title: "", html: { th: { class: "span1" } } do |cost|
			  	user_mini_avatar(cost.user)
			  end
			  column title: "", html: { th: { class: "span1" } } do |cost|
			  	concat link_to t("defaults.link.edit"), edit_cost_path(cost) unless options[:hide_edit_link]
			  	#concat "|"
			  	#concat link_to t("defaults.link.destroy"), cost, method: :delete, data: {confirm: t("defaults.messages.destroy_confirm") } if options[:show_delete_link]
			  end
			end
		end

		content <<	(content_tag :div, class: "pagination" do
			paginate costs
		end if options[:show_pagination])

		content.html_safe
	end
end