# This migration comes from logistics (originally 20130911204935)
class CreateLogisticsTransports < ActiveRecord::Migration
  def change
    create_table :logistics_transports do |t|
      t.integer  :position_id, null: false
      t.string   :trans_method, :limit => 20, null: false
      t.string   :vessel, :limit => 20
      t.string   :truck, :limit => 20
      t.string   :voyage, :limit => 20
      t.string   :vagon
      t.string   :waybill_no, :limit => 40
      t.date     :waybill_date
      t.string   :driver_name, :limit => 60
      t.integer  :driver_id
      t.integer  :owner_id
      t.integer  :supplier_id
      t.integer  :branch_id
      t.integer  :user_id, null: false
      t.integer  :patron_id, null: false
      t.date     :departure_date
      t.string   :departure_hour, limit: 5
      t.string   :dep_place_type, limit: 10
      t.string   :dep_place, limit: 60
      t.string   :dep_city, limit: 60
      t.string   :dep_country_id, limit: 2
      t.date     :arrival_date
      t.string   :arrival_hour, limit: 5
      t.string   :arv_place_type, limit: 10
      t.string   :arv_place, limit: 60
      t.string   :arv_city, limit: 60
      t.string   :arv_country_id, limit: 2
      t.decimal  :freight_price, :default => 0
      t.string   :freight_curr, :limit => 5
      t.text     :notes
      t.string   :status, limit: 10, default: "active"
      t.boolean  :trashed, default: false

      t.timestamps
    end

    add_index :logistics_transports, :position_id
    add_index :logistics_transports, :patron_id
    add_index :logistics_transports, :trans_method
  end
end
