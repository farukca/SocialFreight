class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string  :name, :limit => 40, :null => false
      t.string  :code, :limit => 10, :null => false
      t.string  :telcode, :limit => 10
      t.float   :latitude
      t.float   :longitude
      t.boolean :gmaps
      t.string  :slug, :limit => 40
    end
  end
end
