class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id, :null => false
      t.string  :target_type, :limit => 40
      t.integer :target_id
      t.string :target_name, :limit => 60
      t.integer :patron_id, :null => false
      t.string :patron_token, :limit => 20, :null => false
      
      t.timestamps
    end
    
    add_index :activities, [:user_id, :patron_id, :patron_token]
  end
end
