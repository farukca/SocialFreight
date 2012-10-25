class RemovePatronTokenFromPosts < ActiveRecord::Migration
  def up
  	remove_index  :posts, name: "index_posts_on_patron_id_and_patron_token"
  	remove_index  :posts, name: "index_posts_on_target_type_and_target_id"
  	remove_index  :posts, name: "index_posts_on_user_id"
  	remove_column :posts, :patron_token
  	add_index     :posts, [:user_id, :patron_id]
  	add_index     :posts, [:target_type, :target_id, :patron_id]
  	add_index     :posts, :patron_id
  end

  def down
  	add_column    :posts, :patron_token, limit: 20
  end
end
