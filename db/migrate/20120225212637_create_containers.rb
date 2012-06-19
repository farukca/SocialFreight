class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.integer :name, :limit => 40, :null => false
      t.string  :sealno, :limit => 40
      t.string  :container_type, :limit => 40
      t.integer :free_day, :default => 0
      t.decimal :demurrage, :default => 0
      t.string  :demurrage_curr, :limit => 3
      t.string  :notes, :limit => 200
      t.integer :loading_id, :null => false
      
      t.timestamps
    end

    add_index :containers, :loading_id
    add_index :containers, [:name, :loading_id], :unique => true
  end
end
