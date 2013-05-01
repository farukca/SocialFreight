module BranchesHelper

  def branch_name(branch = @branch)
    branch.name
  end

	def branches_list_table(branches=@branches, options={})
		content = content_tag :div, class: "row-fluid", id: "branches_list_div" do
			table_for branches, html: {class: "table table-bordered table-condensed", id: "branches_list_table"} do
				column title: t("branches.label.name"), html: { th: { class: "span2" }  } do |branch|
          link_to branch_name(branch), branch_path(branch)
				end
			  column :tel, title: t("branches.label.tel"), html: { th: { class: "span1" } }
			  column :fax, title: t("branches.label.fax"), html: { th: { class: "span1" } }
			  column title: t("branches.label.email"), html: { th: { class: "span2" } } do |branch|
			  	mail_to branch.email, branch.email
			  end
			  column :city, title: t("defaults.label.city"), html: { th: { class: "span1" } }
			  column title: t("defaults.label.country"), html: { th: { class: "span1" }  } do |branch|
			  	country_name(branch.country_id)
			  end
			  column title: "", html: { th: { class: "span1" } } do |branch|
			  	concat link_to t("defaults.link.edit"), edit_branch_path(branch) unless options[:hide_edit_link]
			  	concat "|"
			  	concat link_to t("defaults.link.destroy"), branch, method: :delete, data: {confirm: t("defaults.messages.destroy_confirm") } if options[:show_delete_link]
			  end
			end
		end
	end

end