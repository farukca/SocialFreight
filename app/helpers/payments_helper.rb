module PaymentsHelper

	def payments_list_table(payments=@payments, options={})
		content = content_tag :div, class: "row-fluid", id: "payments_list_div" do
			table_for payments, html: {class: "table table-bordered table-condensed", id: "payments_list_table"} do
			  column title: t("payments.label.name"), html: { th: { class: "span2" }  } do |payment|
			  	link_to payment.payment_date, payment_path(payment)
			  end
			  column title: t("defaults.label.fax"), html: { th: { class: "span3" } } do |payment|
			  	link_to person_name(payment.staff), person_path(payment.staff)
			  end
			  column title: t("defaults.label.website"), html: { th: { class: "span3" } } do |payment|
			  	print_price(payment.payment_price, payment.price_curr)
			  end
			  column :payment_docno, title: "Hesap Tarihi", html: { th: { class: "span2" } }
			  #column title: "", html: { th: { class: "span1" } } do |payment|
			  #	user_mini_avatar(payment.user)
			  #end
			  column title: "", html: { th: { class: "span1" } } do |payment|
			  	concat link_to t("defaults.link.edit"), edit_payment_path(payment) unless options[:hide_edit_link]
			  	#concat "|"
			  	#concat link_to t("defaults.link.destroy"), payment, method: :delete, data: {confirm: t("defaults.messages.destroy_confirm") } if options[:show_delete_link]
			  end
			end
		end
		content <<	(content_tag :div, class: "pagination" do
			paginate payoffs
		end if options[:show_pagination])

		content.html_safe
  end

end