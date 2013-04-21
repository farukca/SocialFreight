class ContactTable < TableCloth::Base

  column :name do |contact|
    contact_name(contact)
  end
  column :email
  column :tel do |contact|
    "#{contact.tel} #{contact.gsm}"
  end
  column :jobtitle do |contact|
    "#{contact.jobtitle} #{contact.department}"
  end
  column :company do |contact|
    link_to company_name(contact.company), company_path(contact.company)
  end

  config.table.class = 'table table-condensed table-bordered'
  #config.thead.class = ''
  #config.th.class    = ''
  #config.tbody.class = ''
  #config.tr.class    = ''
  #config.td.class    = ''
  # Define columns with the #column method
  # column :name, :email

  # Columns can be provided a block
  #
  # column :name do |object|
  #   object.downcase
  # end
  #
  # Columns can also have conditionals if you want.
  # The conditions are checked against the table's methods.
  # As a convience, the table has a #view method which will return the current view context.
  # This gives you access to current user, params, etc...
  #
  # column :email, if: :admin?
  #
  # def admin?
  #   view.current_user.admin?
  # end
  #
  # Actions give you the ability to create a column for any actions you'd like to provide.
  # Pass a block with an arity of 2, (object, view context).
  # You can add as many actions as you want.
  #
  actions do
   action {|contact| link_to "Edit", edit_contact_path(contact) }
  end
end
