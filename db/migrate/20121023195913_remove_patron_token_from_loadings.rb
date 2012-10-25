class RemovePatronTokenFromLoadings < ActiveRecord::Migration
  def up
  	remove_index  :loadings, name: "index_loadings_on_patron_id_and_patron_token_and_branch_id"
  	remove_index  :loadings, name: "index_loadings_on_reference_and_patron_id_and_patron_token"
  	remove_column :loadings, :patron_token
  	add_index     :loadings, [:user_id, :patron_id]
  	add_index     :loadings, [:branch_id, :patron_id]
  	add_index     :loadings, [:reference, :patron_id]
  end

  def down
  	add_column    :loadings, :patron_token, limit: 20
  end
end
