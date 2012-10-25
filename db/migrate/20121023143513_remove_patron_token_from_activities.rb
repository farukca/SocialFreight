class RemovePatronTokenFromActivities < ActiveRecord::Migration
  def up
  	remove_index  :activities, name: "index_activities_on_user_id_and_patron_id_and_patron_token"
  	remove_column :activities, :patron_token
  	add_index     :activities, [:user_id, :patron_id]
  end

  def down
  	add_column    :activities, :patron_token, limit: 20
  end
end
