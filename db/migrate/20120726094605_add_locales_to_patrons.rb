class AddLocalesToPatrons < ActiveRecord::Migration
  def change
  	change_table :patrons do |t|
  	  t.string :locale, limit: 20
  	  t.string :mail_encoding, limit: 20
    end
  end
end
