# This migration comes from logistics (originally 20130911212931)
class CreateLogisticsArrivals < ActiveRecord::Migration
  def change
    create_table  :logistics_arrivals do |t|
      t.integer   :loading_id, null: false
      t.date      :unload_date, null: false
      t.date      :delivery_date
      t.string    :unload_point, :limit => 10
      t.boolean   :post_trans, default: false
      t.string    :unload_place_code, limit: 20
      t.string    :unload_place, limit: 60
      t.string    :unload_city, limit: 60
      t.string    :country_id, :limit => 2, null: false
      t.string    :district, :limit => 30
      t.string    :postcode, :limit => 5
      t.string    :address, :limit => 100
      t.float     :longitude
      t.float     :latitude
      t.boolean   :gmaps
      t.string    :consignee, limit: 60
      t.string    :notify, limit: 60
      t.string    :notify2, limit: 60
      t.string    :deliver, limit: 60
      t.string    :custom, limit: 60
      t.string    :customofficer, limit: 60
      t.string    :statement, :limit => 20
      t.date      :statement_date
      t.integer   :user_id, null: false
      t.integer   :patron_id, null: false
      t.text      :notes

      t.timestamps
    end

    add_index :logistics_arrivals, :loading_id
    add_index :logistics_arrivals, [:patron_id, :country_id]
  end
end
