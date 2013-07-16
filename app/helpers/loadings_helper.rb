module LoadingsHelper
  
  def loading_name(loading = @loading)
  	loading.reference
  end

  def loading_freight_price(loading=@loading)
  	"#{number_to_currency(loading.freight_price, precision: 2)} #{loading.freight_curr}"
  end

  def loading_brut_weight(loading=@loading)
  	"#{loading.brut_wg} #{loading.weight_unit}"
  end

	def loadings_list_table(loadings=@loadings, options={})
		content = content_tag :div, class: "row-fluid", id: "loadings_list_div" do
			table_for loadings, html: {class: "table table-bordered table-condensed", id: "loadings_list_table"} do
			  column title: t("loadings.label.name"), html: { th: { class: "span2" }  } do |loading|
			  	link_to loading.reference, loading_path(loading)
			  end
			  column title: t("defaults.label.tel"), html: { th: { class: "span2" } } do |loading|
			  	link_to company_name(loading.company), company_path(loading.company)
			  end
			  column title: t("defaults.label.fax"), html: { th: { class: "span1" } } do |loading|
			  	t("countries.#{loading.load_coun}") if loading.load_coun
			  end
			  column title: t("defaults.label.website"), html: { th: { class: "span1" } } do |loading|
			  	t("countries.#{loading.unload_coun}") if loading.unload_coun
			  end
			  column title: "", html: { th: { class: "span2" } } do |loading|
			  	link_to position_name(loading.position), position_path(loading.position) if loading.position
			  end
			  column :commodity, title: t("defaults.label.website"), html: { th: { class: "span2" } }
			  column title: "", html: { th: { class: "span1" } } do |loading|
			  	user_mini_avatar(loading.user)
			  end
			  column title: "", html: { th: { class: "span1" } } do |loading|
			  	concat link_to t("defaults.link.edit"), edit_loading_path(loading) unless options[:hide_edit_link]
			  	#concat "|"
			  	#concat link_to t("defaults.link.destroy"), loading, method: :delete, data: {confirm: t("defaults.messages.destroy_confirm") } if options[:show_delete_link]
			  end
			end
		end

		content <<	(content_tag :div, class: "pagination" do
			paginate loadings
		end if options[:show_pagination])

		content.html_safe
	end
end