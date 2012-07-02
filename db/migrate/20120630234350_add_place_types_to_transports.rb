class AddPlaceTypesToTransports < ActiveRecord::Migration
  def change
  	change_table :transports do |t|
      t.string :dep_place_type, limit: 1
      t.string :arv_place_type, limit: 1
    end
  end
end
