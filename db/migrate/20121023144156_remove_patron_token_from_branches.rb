class RemovePatronTokenFromBranches < ActiveRecord::Migration
  def up
  	remove_index  :branches, name: "index_branches_on_patron_id_and_patron_token"
  	remove_column :branches, :patron_token
  	add_index     :branches, :patron_id
  end

  def down
  	add_column    :branches, :patron_token, limit: 20
  end
end