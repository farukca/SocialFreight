class CreateDepartures < ActiveRecord::Migration
  def change
    create_table :departures do |t|
      t.integer :loading_id
      t.timestamp :load_date
      t.timestamp :pickup_date
      t.string  :load_point, :limit => 1
      t.integer :load_place_id
      t.integer :city_id
      t.string  :country_id, :limit => 2
      t.string  :district, :limit => 30
      t.string  :postcode, :limit => 5
      t.string  :address, :limit => 100
      t.float   :longitude
      t.float   :latitude
      t.boolean :gmaps
      t.integer :loader_id
      t.integer :sender_id
      t.integer :custom_id
      t.integer :customofficer_id
      t.string  :statement, :limit => 20
      t.date    :statement_date
      t.string  :notes, :limit => 250
      
      t.timestamps
    end

    add_index :departures, :loading_id
    add_index :departures, [:city_id, :country_id]
  end
end
