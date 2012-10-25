class AddPatronIdIndexToRentals < ActiveRecord::Migration
  def change
    change_column :rentals, :patron_id, :integer, null: false
  	add_index     :rentals, [:vehicle, :patron_id] 
  end
end
