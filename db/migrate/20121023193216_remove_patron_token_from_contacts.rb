class RemovePatronTokenFromContacts < ActiveRecord::Migration
  def up
  	remove_column :contacts, :patron_token
  	add_index     :contacts, :patron_id
  end

  def down
  	add_column    :contacts, :patron_token, limit: 20
  end
end
