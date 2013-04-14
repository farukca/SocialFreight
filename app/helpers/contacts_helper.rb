module ContactsHelper
	def contact_name(contact=@contact)
		contact.to_s
	end
end
