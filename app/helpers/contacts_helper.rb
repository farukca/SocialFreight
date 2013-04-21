module ContactsHelper
	def contact_name(contact=@contact)
		contact.to_s
	end

	def contacts_list_table(contacts=@contacts)
		simple_table_for contacts, with: ContactTable
	end
end
