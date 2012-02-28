class CreateComments < ActiveRecord::Migration

  def change
    create_table :comments do |t|
      t.integer :user_id, :null => false
      t.string :comment_text, :limit => 300
      t.string  :commentable_type, :limit => 40
      t.integer :commentable_id
      t.string :commenter, :limit => 1, :default => 'U'
      t.integer :patron_id, :null => false
      t.string :patron_token, :limit => 20, :null => false
      
      t.timestamps
    end
    
    add_index :comments, [:commentable_type, :commentable_id]
  end
  
end
