class AddPatronIdToDepartures < ActiveRecord::Migration
  def change
  	change_table :departures do |t|
  	  t.integer  :patron_id, null: false
  	end
  	add_index    :departures, :patron_id
  end
end
