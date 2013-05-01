module ContainersHelper

  def container_type_label(container=@container)
    container.container_type
  end

	def containers_list_table(containers=@containers, options={})
		content = content_tag :div, class: "row-fluid", id: "containers_list_div" do
			table_for containers, html: {class: "table table-bordered table-condensed", id: "containers_list_table"} do
				column title: t("containers.label.container_type"), html: { th: { class: "span2" }  } do |container|
          link_to container_type_label(container), container_path(container)
				end
			  column :name, title: t("containers.label.name"), html: { th: { class: "span2" } }
			  column :sealno, title: t("containers.label.sealno"), html: { th: { class: "span2" } }
			  column :free_day, title: t("containers.label.free_day"), html: { th: { class: "span1" } }
			  column title: t("containers.label.demurrage"), html: { th: { class: "span1" }  } do |container|
			  	print_price(container.demurrage, container.demurrage_curr)
			  end
			  column title: "", html: { th: { class: "span1" } } do |container|
			  	concat link_to t("defaults.link.edit"), edit_container_path(container) unless options[:hide_edit_link]
			  	concat "|"
			  	concat link_to t("defaults.link.destroy"), container, method: :delete, data: {confirm: t("defaults.messages.destroy_confirm") } if options[:show_delete_link]
			  end
			end
		end
	end

end