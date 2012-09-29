class AddUnloadPlaceCodeToArrivals < ActiveRecord::Migration
  def up
  	add_column :arrivals, :unload_city, :string, limit: 100
  	add_column :arrivals, :unload_place_code, :string, limit: 20
  	add_column :arrivals, :creater_id, :integer, default: 0
  	add_column :arrivals, :updater_id, :integer, default: 0
  end

  def down
  	remove_column :arrivals, :unload_city
  	remove_column :arrivals, :unload_place_code
  	remove_column :arrivals, :creater_id
  	remove_column :arrivals, :updater_id
  end
end