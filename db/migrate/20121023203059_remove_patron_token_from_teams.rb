class RemovePatronTokenFromTeams < ActiveRecord::Migration
  def up
  	remove_index  :teams, name: "index_teams_on_patron_id_and_patron_token"
  	remove_column :teams, :patron_token
  	add_index     :teams, :patron_id
  end

  def down
  	add_column    :teams, :patron_token, limit: 20
  end
end
