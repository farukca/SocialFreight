class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id, :null => false
      t.string  :message, :limit => 300
      t.string  :target_type, :limit => 40
      t.integer :target_id
      t.string  :target_name, :limit => 40
      t.string  :post_type, :limit => 2
      t.boolean :is_private, :default => false
      t.boolean :is_syspost, :default => false
      t.integer :patron_id, :null => false
      t.string  :patron_token, :limit => 20, :null => false
      
      t.timestamps
    end
    
    add_index :posts, [:target_type, :target_id]
    add_index :posts, [:patron_id, :patron_token]
  end
end
