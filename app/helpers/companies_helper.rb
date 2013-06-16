module CompaniesHelper

  def company_name(company=@company)
  	company.name
  end

  def company_website(company=@company)
  	link_to company.website, url_with_protocol(company.website), target: '_blank' if company.website.present?
  end

  def company_input_hint
  	link_to t("companies.hint.add_company"), new_company_path(nolayout: 1), "data-toggle" => "modal", "data-target" => "#newAgileRecord"
  end

	def companies_list_table(companies=@companies, options={})
		content = content_tag :div, class: "row-fluid", id: "companies_list_div" do
			table_for companies, html: {class: "table table-bordered table-condensed", id: "companies_list_table"} do
			  column title: t("companies.label.name"), html: { th: { class: "span3" }  } do |company|
			  	link_to company_name(company), company_path(company)
			  end
			  column :tel, title: t("defaults.label.tel"), html: { th: { class: "span2" } }
			  column :fax, title: t("defaults.label.fax"), html: { th: { class: "span2" } }
			  column title: t("defaults.label.website"), html: { th: { class: "span2" } } do |company|
			  	company_website(company)
			  end
			  column title: "", html: { th: { class: "span1" } } do |company|
			  	image_tag user_mini_avatar(company.user), class: "img-circle", title: user_name(company.user)
			  end
			  column title: "", html: { th: { class: "span1" } } do |company|
			  	concat link_to t("defaults.link.edit"), edit_company_path(company) unless options[:hide_edit_link]
			  	#concat "|"
			  	#concat link_to t("defaults.link.destroy"), company, method: :delete, data: {confirm: t("defaults.messages.destroy_confirm") } if options[:show_delete_link]
			  end
			end
		end

		content <<	(content_tag :div, class: "pagination" do
			paginate companies
		end if options[:show_pagination])

		content.html_safe
	end

end
