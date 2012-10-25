class AddPatronIdIndexToPackages < ActiveRecord::Migration
  def change
  	change_table :packages do |t|
  	  t.integer  :patron_id, null: false
  	end
  	add_index    :packages, :patron_id
  end
end
