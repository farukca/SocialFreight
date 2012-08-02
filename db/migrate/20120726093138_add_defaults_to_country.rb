class AddDefaultsToCountry < ActiveRecord::Migration
  def change
  	change_table :countries do |t|
  	  t.string :locale, limit: 20
  	  t.string :language, limit: 10
  	  t.string :time_zone
  	  t.string :mail_encoding, limit: 20
    end
  end
end
