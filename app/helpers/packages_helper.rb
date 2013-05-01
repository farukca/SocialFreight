module PackagesHelper

  def print_dimensions(package=@package)
  	"#{package.dimension1} X #{package.dimension2} X #{package.dimension3}"
  end

  def package_info(package=@package)
  	"#{package.total} #{package.pack_type}"
  end

	def packages_list_table(packages=@packages, options={})
		content = content_tag :div, class: "row-fluid", id: "packages_list_div" do
			table_for packages, html: {class: "table table-bordered table-condensed", id: "packages_list_table"} do
				column title: t("packages.title.package_info"), html: { th: { class: "span2" }  } do |package|
          link_to package_info(package), package_path(package)
				end
			  column title: t("packages.label.dimension1"), html: { th: { class: "span2" } } do |package|
			  	print_dimensions(package)
			  end
			  column :brutwg, title: t("defaults.label.brut_weight"), html: { th: { class: "span1" } }
			  column :netwg, title: t("packages.label.net_weight"), html: { th: { class: "span1" } }
			  column title: "", html: { th: { class: "span1" } } do |package|
			  	concat link_to t("defaults.link.edit"), edit_package_path(package) unless options[:hide_edit_link]
			  	concat "|"
			  	concat link_to t("defaults.link.destroy"), package, method: :delete, data: {confirm: t("defaults.messages.destroy_confirm") } if options[:show_delete_link]
			  end
			end
		end
	end

end