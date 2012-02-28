class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, :limit => 40, :null => false
      t.string  :code, :limit => 10
      t.string  :telcode, :limit => 10
      t.integer :state_id
      t.integer :country_id
      t.float   :latitude
      t.float   :longitude
      t.boolean :gmaps
      t.string  :slug, :limit => 40
    end
    
    add_index :cities, :country_id
  end
end
