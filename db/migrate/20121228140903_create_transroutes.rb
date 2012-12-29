class CreateTransroutes < ActiveRecord::Migration
  def change
    create_table :transroutes do |t|
      t.string   :route_type, null: false, limit: 20
      t.string   :route_name, null: false, limit: 60
      t.string   :route_city, limit: 50
      t.string   :route_country, null: false, limit: 2
      t.date     :arrival_date
      t.date     :departure_date
      t.integer  :route_id
      t.float    :longitude
      t.float    :latitude
      t.boolean  :gmaps
      t.integer  :transport_id, null: false
      t.integer  :patron_id, null: false
      t.string   :notes, limit: 250

      t.timestamps
    end
  end
end
