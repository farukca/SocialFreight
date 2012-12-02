class AddCityToPatrons < ActiveRecord::Migration
  def change
  	change_table :patrons do |t|
  		t.string :city, limit: 100
  		t.string :state, limit: 100
  	end
  end
end
