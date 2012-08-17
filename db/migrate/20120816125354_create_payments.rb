class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :staff_id, null: false
      t.date    :payment_date, null: false
      t.string  :payment_docno, limit: 20
      t.decimal :payment_price, default: 0
      t.string  :price_curr, null: false
      t.boolean :confirmed, default: false
      t.integer :confirmer_id
      t.date    :confirm_date
      t.text    :notes
      t.integer :finunit_id
      t.integer :payoff_id, null: false
      t.integer :branch_id, null: false
      t.integer :patron_id, null: false
      t.integer :creater_id, null: false
      t.integer :updater_id, null: false

      t.timestamps
    end
  end
end
