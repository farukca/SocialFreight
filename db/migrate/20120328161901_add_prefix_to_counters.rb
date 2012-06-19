class AddPrefixToCounters < ActiveRecord::Migration
  def change
    change_table :counters do |t|
      t.string :prefix, :limit => 10
      t.string :suffix, :limit => 10
      t.integer :period, :default => 0
    end
    add_index :counters, ["patron_id", "counter_type", "operation", "period"], :name => "index_counters_unique", :unique => true
  end
end
