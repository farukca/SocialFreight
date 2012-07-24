class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.string  :referans, limit: 20, null: false
      t.string  :rent_direction, limit: 1
      t.string  :vehicle, limit: 50
      t.string  :vehicle_class, limit: 20
      t.string  :vehicle_type, limit: 20
      t.string  :vehicle_brand, limit: 50
      t.string  :vehicle_model, limit: 20
      t.integer :vehicle_firstkm, default: 0
      t.integer :vehicle_lastkm, default: 0
      t.string  :operator, limit: 50
      t.boolean :fuel_flag, default: false
      t.date    :start_date, null: false
      t.date    :finish_date, null: false
      t.string  :rent_status, limit: 1
      t.integer :company_id, null: false
      t.decimal :rent_price
      t.string  :price_curr, limit: 1
      t.integer :patron_id
      t.integer :user_id
      t.string  :notes, limit: 255

      t.timestamps
    end
  end
end
