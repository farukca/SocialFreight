class CreateArrivals < ActiveRecord::Migration
  def change
    create_table :arrivals do |t|
      t.integer :loading_id
      t.timestamp :unload_date
      t.timestamp :delivery_date
      t.string :unload_point, :limit => 1
      t.integer :unload_place_id
      t.integer :city_id
      t.string  :country_id, :limit => 2
      t.string  :district, :limit => 30
      t.string  :postcode, :limit => 5
      t.string  :address, :limit => 100
      t.float   :longitude
      t.float   :latitude
      t.boolean :gmaps
      t.integer :consignee_id
      t.integer :notify_id
      t.integer :notify2_id
      t.integer :deliver_id
      t.integer :custom_id
      t.integer :customofficer_id
      t.string  :statement, :limit => 20
      t.date    :statement_date
      t.string  :notes, :limit => 250

      t.timestamps
    end
    
    add_index :arrivals, :loading_id
    add_index :arrivals, [:city_id, :country_id]
  end
end
