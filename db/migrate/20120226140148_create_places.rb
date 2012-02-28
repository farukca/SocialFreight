class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string  :name, :limit => 50
      t.string  :code, :limit => 20
      t.string  :place_type, :limit => 4
      t.string  :district, :limit => 30
      t.string  :postcode, :limit => 5
      t.string  :address, :limit => 100
      t.integer :city_id
      t.integer :country_id
      t.float   :longitude
      t.float   :latitude
      t.boolean :gmaps
      t.string  :description, :limit => 250
      t.string  :slug, :limit => 50
      
      t.timestamps
    end

    add_index :places, [:city_id, :country_id]
  end
end
