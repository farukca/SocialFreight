class AddPatronIdToTransports < ActiveRecord::Migration
   def change
  	change_table :transports do |t|
  	  t.integer  :transports, :patron_id, null: false
  	end
  	add_index    :transports, [:vessel, :voyage, :patron_id]
  	add_index    :transports, [:position_id, :patron_id]
  end
end
