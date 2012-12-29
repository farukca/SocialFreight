class AddRegionsToCountries < ActiveRecord::Migration
  def change
  	change_table :countries do |t|
  		t.string   :domain, limit: 10
  		t.string   :code3, limit: 3
  		t.string   :currency, limit: 20
  		t.string   :region, limit: 100
  		t.string   :subregion, limit: 100
  		t.boolean  :listable, default: true
  	end
  end
end
