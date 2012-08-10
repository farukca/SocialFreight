class CreatePayoffs < ActiveRecord::Migration
  def change
    create_table :payoffs do |t|
      t.string  :name, limit: 30, null: false
      t.date    :payoff_date, null: false
      t.integer :staff_id, null: false
      t.string  :payoff_type, limit:20, null: false
      t.integer :transport_id
      t.string  :truck, limit: 30
      t.string  :vehicle, limit: 30
      t.string  :voyage, limit: 30
      t.date    :departure_date
      t.integer :departure_km, default: 0
      t.string  :departure_place, limit: 100
      t.date    :arrival_date
      t.integer :arrival_km, default: 0
      t.string  :arrival_place, limit: 100
      t.date    :return_date
      t.integer :return_km, default: 0
      t.string  :return_place, limit: 100
      t.text    :notes
      t.boolean :approved, default: false
      t.date    :approved_date
      t.integer :user_id, null: false
      t.integer :patron_id, null: false
      t.decimal :payoff_price, default: 0
      t.decimal :price_curr, default: 0
      t.string  :credit_debit, limit: 10
      t.string  :slug, limit: 30, null: false
      
      t.timestamps
    end
  end
end