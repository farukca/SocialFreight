class AddDepArvPlacesToTransports < ActiveRecord::Migration
  def change
  	change_table :transports do |t|
      t.string :dep_place, limit: 60
      t.string :arv_place, limit: 60
      t.string :dep_city, limit: 100
      t.string :arv_city, limit: 100
  	end
  end
end
