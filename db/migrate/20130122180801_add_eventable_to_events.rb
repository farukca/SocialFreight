class AddEventableToEvents < ActiveRecord::Migration
  def change
  	change_table :events do |t|
  	  t.string   :eventable_type, limit: 100
  	  t.integer  :eventable_id
    end
    add_index :events, [:patron_id, :eventable_type, :eventable_id], name: "index_eventable_patron"
  end
end
