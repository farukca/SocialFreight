class AddPatronIdIndexToVehicles < ActiveRecord::Migration
  def change
  	change_column :vehicles, :patron_id, :integer, null: false
  end
end
