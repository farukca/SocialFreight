class AddPatronIdToArrivals < ActiveRecord::Migration
  def change
  	change_table :arrivals do |t|
  	  t.integer  :patron_id, null: false
  	end
  	add_index    :arrivals, :patron_id
  end
end
