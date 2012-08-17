class CreateFuels < ActiveRecord::Migration
  def change
    create_table :fuels do |t|
      t.date    :process_date, null: false
      t.string  :process_type, null: false
      t.string  :truck, limit: 20
      t.string  :vehicle, limit: 20
      t.integer :staff_id, null: false
      t.decimal :fuel_amount, default: 0
      t.string  :amount_type, limit: 20, null: false
      t.string  :document_no, limit: 20
      t.string  :document_date
      t.decimal :fuel_price, default: 0
      t.string  :price_curr, limit: 20
      t.string  :payment_type, limit: 20
      t.string  :payment_card, limit: 20
      t.integer :depot_id
      t.string  :payment_firm, limit: 50
      t.integer :payoff_id
      t.text    :notes
      t.string  :country_id
      t.integer :city_id
      t.integer :branch_id, null: false
      t.integer :patron_id, null: false
      t.integer :creater_id, null: false
      t.integer :updater_id, null: false

      t.timestamps
    end
  end
end
