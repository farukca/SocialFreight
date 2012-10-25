class RemovePatronTokenFromPositions < ActiveRecord::Migration
  def up
  	remove_index  :positions, name: "index_positions_on_patron_id_and_patron_token_and_branch_id"
  	remove_index  :positions, name: "index_positions_on_reference_and_patron_id_and_patron_token"
  	remove_column :positions, :patron_token
  	add_index     :positions, [:user_id, :patron_id]
  	add_index     :positions, [:branch_id, :patron_id]
  	add_index     :positions, [:reference, :patron_id]
  end

  def down
  	add_column    :positions, :patron_token, limit: 20
  end
end
