# This migration comes from logistics (originally 20130911211840)
class CreateLogisticsTransroutes < ActiveRecord::Migration
  def change
    create_table :logistics_transroutes do |t|
      t.string   :route_type, null: false, limit: 20
      t.string   :route_name, null: false, limit: 60
      t.string   :route_city, limit: 50
      t.string   :route_country, null: false, limit: 2
      t.date     :arrival_date
      t.date     :departure_date
      t.integer  :transport_id, null: false
      t.integer  :route_id
      t.float    :longitude
      t.float    :latitude
      t.boolean  :gmaps
      t.integer  :patron_id, null: false
      t.boolean  :trashed, default: false
      t.text     :notes

      t.timestamps
    end

    add_index :logistics_transroutes, :transport_id
    add_index :logistics_transroutes, [:patron_id, :route_id]
  end
end
