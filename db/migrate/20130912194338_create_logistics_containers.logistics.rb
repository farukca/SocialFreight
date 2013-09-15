# This migration comes from logistics (originally 20130911203810)
class CreateLogisticsContainers < ActiveRecord::Migration
  def change
    create_table :logistics_containers do |t|
      t.integer :name, :limit => 40, :null => false
      t.string  :sealno, :limit => 40
      t.string  :container_type, :limit => 40
      t.integer :loading_id, :null => false
      t.integer :patron_id, :null => false
      t.boolean :trashed, default: false
      t.integer :free_day, :default => 0
      t.date    :due_date
      t.decimal :demurrage, :default => 0
      t.string  :demurrage_curr, :limit => 3
      t.text    :notes

      t.timestamps
    end

    add_index :logistics_containers, :loading_id
    add_index :logistics_containers, [:name, :loading_id], :unique => true
  end
end
