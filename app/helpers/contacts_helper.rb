module ContactsHelper

	def contact_name(contact=@contact)
		contact.to_s
	end

	def contact_jobinfo(contact=@contact)
		content = content_tag :span, class: "jobtitle" do
			contact.jobtitle
		end
    if contact.department
    	content << " / "
      content << (content_tag :span, class: "department" do
			  contact.department
			end)
		end
    if contact.company
    	content << " / "
    	content << (content_tag :span, class: "company" do
				link_to company_name(contact.company), company_path(contact.company)
			end)
		end
		content.html_safe
	end

	def contacts_list_table(contacts=@contacts, options={})
		content = content_tag :div, class: "row-fluid", id: "contacts_list_table" do
			table_for contacts, html: {class: "table table-bordered table-condensed", id: "contacts_list_table"} do
			  column title: t("companies.label.contact_name"), html: { th: { class: "span2" }  } do |contact|
			  	link_to contact_name(contact), contact_path(contact)
			  end
			  column :email, title: t("defaults.label.email"), html: { th: { class: "span2" } }
			  column title: t("defaults.label.tel"), html: { th: { class: "span2" } } do |contact|
			  	"#{contact.tel} #{contact.gsm}"
			  end
			  column title: t("companies.label.name"), html: { th: { class: "span2" } } do |contact|
			  	link_to company_name(contact.company), company_path(contact.company)
			  end
			  column title: t("companies.label.jobtitle"), html: { th: { class: "span3" } } do |contact|
			  	"#{contact.jobtitle}/#{contact.department}"
			  end
			  column title: "", html: { th: { class: "span1" } } do |contact|
			  	concat link_to t("defaults.link.edit"), edit_contact_path(contact) unless options[:hide_edit_link]
			  	concat "|"
			  	concat link_to t("defaults.link.destroy"), contact, method: :delete, data: {confirm: t("defaults.messages.destroy_confirm") } if options[:show_delete_link]
			  end
			end
		end

		content <<	(content_tag :div, class: "pagination" do
			paginate contacts
		end if options[:show_pagination])

		content.html_safe
	end

end
