class AddLoadPlaceCodeToDepartures < ActiveRecord::Migration
  def up
  	add_column :departures, :load_city, :string, limit: 100
  	add_column :departures, :load_place_code, :string, limit: 20
  	add_column :departures, :creater_id, :integer, default: 0
  	add_column :departures, :updater_id, :integer, default: 0
  end

  def down
  	remove_column :departures, :load_city
  	remove_column :departures, :load_place_code
  	remove_column :departures, :creater_id
  	remove_column :departures, :updater_id
  end
end
