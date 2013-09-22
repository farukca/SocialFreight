# This migration comes from fleet (originally 20130921105524)
class CreateFleetVehicles < ActiveRecord::Migration
  def change
    create_table :fleet_vehicles do |t|
    	t.string   :name, limit: 255, null: false
      t.string   :code, limit: 20, null: false
      t.string   :vehicle_class, limit: 20
      t.string   :vehicle_type, limit: 20
      t.string   :brand,  limit: 20      
      t.string   :model, limit: 50
      t.integer  :model_year
      t.integer  :patron_id
      t.string   :owner, limit: 50
      t.decimal  :vehicle_price, default: 0
      t.string   :price_curr, limit: 5
      t.date     :buying_date
      t.integer  :fuel_capacity
      t.string   :fuel_type, limit: 10
      t.string   :tire_size, limit: 2
      t.string   :link_type, limit: 2
      t.float    :longitude
      t.float    :latitude
      t.string   :slug, limit: 20
      t.text     :notes

      t.timestamps
    end

    add_index :fleet_vehicles, [:code, :patron_id], :unique => true
    add_index :fleet_vehicles, :patron_id
  end
end
