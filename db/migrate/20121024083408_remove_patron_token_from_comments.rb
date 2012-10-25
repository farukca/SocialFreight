class RemovePatronTokenFromComments < ActiveRecord::Migration
  def up
  	remove_index  :comments, name: "index_comments_on_commentable_type_and_commentable_id"
  	remove_index  :comments, name: "index_comments_on_user_id"
  	remove_column :comments, :patron_token
  	add_index     :comments, [:commentable_type, :commentable_id, :patron_id], name: "index_on_commentable_patron"
  	add_index     :comments, [:user_id, :patron_id]
  end

  def down
  	add_column    :comments, :patron_token, limit: 20
  end
end
