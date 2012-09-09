class AddLoadPlaceToDepartures < ActiveRecord::Migration
  def change
  	change_table :departures do |t|
  	  t.string   :load_place, limit: 60
  	end
  end
end
