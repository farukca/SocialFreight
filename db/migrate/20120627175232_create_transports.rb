class CreateTransports < ActiveRecord::Migration
  def change
    create_table :transports do |t|
      t.integer :position_id
      t.string  :trans_method, :limit => 20
      t.string  :vessel, :limit => 20
      t.string  :truck, :limit => 20
      t.string  :voyage, :limit => 20
      t.string  :vagon
      t.string  :waybill_no, :limit => 40
      t.date    :waybill_date
      t.string  :driver_name, :limit => 60
      t.integer :driver_id
      t.integer :owner_id
      t.integer :supplier_id
      t.integer :dep_place_id
      t.integer :dep_city_id
      t.string  :dep_country_id, :limit => 2
      t.integer :arv_place_id
      t.integer :arv_city_id
      t.string  :arv_country_id, :limit => 2
      t.date    :departure_date, :null => false
      t.string  :departure_hour, :limit => 5
      t.date    :arrival_date, :null => false
      t.string  :arrival_hour, :limit => 5
      t.decimal :freight_price, :default => 0
      t.string  :freight_curr, :limit => 5
      t.string  :notes, :limit => 1000

      t.timestamps
    end
  end
end
