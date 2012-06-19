class CreateCounters < ActiveRecord::Migration
  def change
    create_table :counters do |t|
      t.string  :counter_type, :limit => 40, :null => false
      t.string  :operation, :limit => 20
      t.string  :direction, :limit => 1
      t.integer :count, :null => false, :default => 0
      t.integer :patron_id, :null => false
    end

    add_index :counters, [:patron_id, :counter_type, :operation], :unique => true
  end
end
