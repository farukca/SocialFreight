# This migration comes from logistics (originally 20130911212940)
class CreateLogisticsDepartures < ActiveRecord::Migration
  def change
    create_table  :logistics_departures do |t|
      t.integer   :loading_id, null: false
      t.date      :load_date, null: false
      t.date      :pickup_date
      t.string    :load_point, :limit => 10
      t.boolean   :pre_trans, default: false
      t.string    :load_place_code, limit: 20
      t.string    :load_place, limit: 60
      t.string    :load_city, limit: 60
      t.string    :country_id, :limit => 2
      t.string    :district, :limit => 30
      t.string    :postcode, :limit => 5
      t.string    :address, :limit => 100
      t.float     :longitude
      t.float     :latitude
      t.boolean   :gmaps
      t.string    :loader, limit: 60
      t.string    :sender, limit: 60
      t.string    :custom, limit: 60
      t.string    :customofficer, limit: 60
      t.string    :statement, :limit => 20
      t.date      :statement_date
      t.integer   :user_id, null: false
      t.integer   :patron_id, null: false
      t.text      :notes

      t.timestamps
    end

    add_index :logistics_departures, :loading_id
    add_index :logistics_departures, [:patron_id, :country_id]
  end
end
