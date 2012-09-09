class AddUnloadPlaceToArrivals < ActiveRecord::Migration
  def change
  	change_table :arrivals do |t|
  	  t.boolean  :post_trans, default: false
  	  t.string   :unload_place, limit: 60
  	end
  end
end
