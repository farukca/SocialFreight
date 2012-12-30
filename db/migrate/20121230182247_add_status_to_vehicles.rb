class AddStatusToVehicles < ActiveRecord::Migration
  def change
  	change_table :vehicles do |t|
  		t.string   :vehicle_status, limit: 20
  		t.string   :motor_number, limit: 50
    end
  end
end
