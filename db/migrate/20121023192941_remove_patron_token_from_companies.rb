class RemovePatronTokenFromCompanies < ActiveRecord::Migration
  def up
  	remove_index  :companies, name: "index_companies_on_name_and_patron_id_and_patron_token"
  	remove_column :companies, :patron_token
  	add_index     :companies, :patron_id
  end

  def down
  	add_column    :companies, :patron_token, limit: 20
  end
end
