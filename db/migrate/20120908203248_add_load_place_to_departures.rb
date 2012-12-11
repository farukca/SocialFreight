class AddLoadPlaceToDepartures < ActiveRecord::Migration
  def change
  	change_table :departures do |t|
  	  t.boolean  :pre_trans, default: false
  	  t.string   :load_place, limit: 60
  	end
  end
end
