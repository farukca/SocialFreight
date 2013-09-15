# This migration comes from nimbos (originally 20130915095357)
class CreateNimbosCounters < ActiveRecord::Migration
  def change
    create_table :nimbos_counters do |t|
      t.string :counter_type
      t.integer :count
      t.string :prefix
      t.string :suffix
      t.integer :period
      t.boolean :confirmed
      t.integer :patron_id

      t.timestamps
    end
  end
end
