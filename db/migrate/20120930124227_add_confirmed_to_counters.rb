class AddConfirmedToCounters < ActiveRecord::Migration
  def change
  	change_table :counters do |t|
      t.boolean :confirmed, default: false
    end
  end
end
