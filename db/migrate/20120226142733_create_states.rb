class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string  :name, :limit => 40, :null => false
      t.string  :code, :limit => 10
      t.string  :telcode, :limit => 10
      t.string  :country_id, :limit => 2
      t.float   :latitude
      t.float   :longitude
      t.boolean :gmaps
      t.string  :slug, :limit => 40
    end

    add_index :states, :country_id
  end
end
