class AddPatronIdIndexToCosts < ActiveRecord::Migration
  def change
  	change_column :costs, :patron_id, :integer, null: false
  	add_index     :costs, :patron_id 
  end
end
