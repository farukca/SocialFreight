module PayoffsHelper

  def payoff_name(payoff=@payoff)
    link_to payoff.name, payoff
  end

  def payoff_trucks(payoff=@payoff)
  	"#{payoff.truck} #{payoff.vehicle}"
  end

	def payoffs_list_table(payoffs=@payoffs, options={})
		content = content_tag :div, class: "row-fluid", id: "payoffs_list_div" do
			table_for payoffs, html: {class: "table table-bordered table-condensed", id: "payoffs_list_table"} do
			  column title: t("payoffs.label.name"), html: { th: { class: "span2" }  } do |payoff|
			  	link_to payoff.name, payoff_path(payoff)
			  end
			  column title: t("defaults.label.fax"), html: { th: { class: "span3" } } do |payoff|
			  	link_to person_name(payoff.staff), person_path(payoff.staff)
			  end
			  column title: t("defaults.label.website"), html: { th: { class: "span3" } } do |payoff|
			  	payoff_trucks(payoff)
			  end
			  column :payoff_date, title: "Hesap Tarihi", html: { th: { class: "span2" } }
			  column title: "", html: { th: { class: "span1" } } do |payoff|
			  	user_mini_avatar(payoff.user)
			  end
			  column title: "", html: { th: { class: "span1" } } do |payoff|
			  	concat link_to t("defaults.link.edit"), edit_payoff_path(payoff) unless options[:hide_edit_link]
			  	#concat "|"
			  	#concat link_to t("defaults.link.destroy"), payoff, method: :delete, data: {confirm: t("defaults.messages.destroy_confirm") } if options[:show_delete_link]
			  end
			end
		end

		content <<	(content_tag :div, class: "pagination" do
			paginate payoffs
		end if options[:show_pagination])

		content.html_safe
	end
end