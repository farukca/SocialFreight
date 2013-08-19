# This migration comes from nimbos (originally 20130728100214)
class CreateNimbosCountries < ActiveRecord::Migration
  def change
    create_table :nimbos_countries, :id => false do |t|
      t.string  :code, :limit => 2, :null => false
      t.string  :name, :limit => 40, :null => false
      t.string  :telcode, :limit => 10
      t.float   :latitude
      t.float   :longitude
      t.boolean :gmaps
  	  t.string  :locale, limit: 20
  	  t.string  :language, limit: 10
  	  t.string  :time_zone
  	  t.string  :mail_encoding, limit: 20
  		t.string  :domain, limit: 10
  		t.string  :code3, limit: 3
  		t.string  :currency, limit: 20
  		t.string  :region, limit: 100
  		t.string  :subregion, limit: 100
  		t.boolean :listable, default: true

      t.timestamps
    end

    execute "ALTER TABLE nimbos_countries ADD PRIMARY KEY (code);"

  end
end
