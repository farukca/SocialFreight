module DocumentsHelper

  def document_file_link(document=@document)
  	link_to document.document_file_url, target: "_blank" do
      content_tag :i, class: "icon-file" do
      end
    end
  end

	def documents_list_table(documents=@documents, options={})
		content = content_tag :div, class: "row-fluid", id: "documents_list_div" do
			table_for documents, html: {class: "table table-bordered table-condensed", id: "documents_list_table"} do
				column title: t("documents.label.document_type"), html: { th: { class: "span2" }  } do |document|
          link_to document.document_type, document_path(document)
				end
			  column :document_date, title: t("documents.label.document_date"), html: { th: { class: "span2" } }
			  column :document_no, title: t("documents.label.document_no"), html: { th: { class: "span2" } }
			  column :description, title: t("documents.label.description"), html: { th: { class: "span3" } }
			  column title: t("documents.label.attachment"), html: { th: { class: "span2" }  } do |document|
			  	document_file_link(document) if document.document_file_url.present?
			  end
			  column title: "", html: { th: { class: "span1" } } do |document|
			  	concat link_to t("defaults.link.edit"), edit_document_path(document) unless options[:hide_edit_link]
			  	concat "|"
			  	concat link_to t("defaults.link.destroy"), document, method: :delete, data: {confirm: t("defaults.messages.destroy_confirm") } if options[:show_delete_link]
			  end
			end
		end
	end

end