module PositionsHelper

  def position_name(position=@position)
    link_to position.reference, position
  end

	def positions_list_table(positions=@positions, options={})
		content = content_tag :div, class: "row-fluid", id: "positions_list_div" do
			table_for positions, html: {class: "table table-bordered table-condensed", id: "positions_list_table"} do
			  column title: t("positions.label.name"), html: { th: { class: "span2" }  } do |position|
			  	link_to position.reference, position_path(position)
			  end
			  column :description, title: t("defaults.label.fax"), html: { th: { class: "span5" } }
			  column title: t("defaults.label.website"), html: { th: { class: "span2" } } do |position|
			  	 branch_name(position.branch) if position.branch
			  end
			  column title: "", html: { th: { class: "span1" } } do |position|
			  	user_mini_avatar(position.user)
			  end
			  column title: "", html: { th: { class: "span1" } } do |position|
			  	concat link_to t("defaults.link.edit"), edit_position_path(position) unless options[:hide_edit_link]
			  	#concat "|"
			  	#concat link_to t("defaults.link.destroy"), position, method: :delete, data: {confirm: t("defaults.messages.destroy_confirm") } if options[:show_delete_link]
			  end
			end
		end

		content <<	(content_tag :div, class: "pagination" do
			paginate positions
		end if options[:show_pagination])

		content.html_safe
	end
end
