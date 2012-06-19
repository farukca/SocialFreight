
class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries, { :id => false } do |t|
      t.string  :code, :limit => 2, :null => false
      t.string  :name, :limit => 40, :null => false
      t.string  :telcode, :limit => 10
      t.float   :latitude
      t.float   :longitude
      t.boolean :gmaps
      t.string  :slug, :limit => 40
    end
    add_index :countries, :slug
    execute "ALTER TABLE countries ADD PRIMARY KEY (code);"
  end
end
