class RemovePatronTokenFromSearches < ActiveRecord::Migration
  def up
  	remove_index  :searches, name: "index_searches_on_patron_id_and_patron_token"
  	remove_column :searches, :patron_token
  	add_index     :searches, :patron_id
  end

  def down
  	add_column    :searches, :patron_token, limit: 20
  end
end
