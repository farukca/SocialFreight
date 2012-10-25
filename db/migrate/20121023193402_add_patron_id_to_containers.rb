class AddPatronIdToContainers < ActiveRecord::Migration
  def change
  	change_table :containers do |t|
  	  t.integer  :patron_id, null: false
  	end

  	add_index    :containers, :patron_id
  end
end
