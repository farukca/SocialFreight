class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.string   :cost_source, limit: 50, null: false
      t.string   :cost_type, limit: 50, null: false
      t.integer  :owner_id
      t.string   :operation, limit: 20
      t.references :costable, polymorphic: true
      t.string   :costable_reference, limit: 50
      t.decimal  :cost_price, default: 0
      t.string   :price_curr, limit: 10
      t.decimal  :cost_vat, default: 0
      t.float    :curr_rate, default: 1
      t.decimal  :local_cost_price, default: 0
      t.decimal  :local_price_vat, default: 0
      t.string   :truck, limit: 20
      t.string   :vehicle, limit: 20
      t.string   :document_no, limit: 20
      t.date     :document_date
      t.string   :cost_firm, limit: 100
      t.string   :cost_taxoffice, limit: 100
      t.string   :cost_taxno, limit: 20
      t.string   :country_id, limit: 20
      t.integer  :city_id
      t.integer  :branch_id
      t.boolean  :settlement_flag, default: true
      t.decimal  :settlement_price, default: 0
      t.string   :settlement_curr, limit: 10
      t.string   :description
      t.string   :cost_file
      t.integer  :user_id, null: false
      t.integer  :patron_id

      t.timestamps
    end
  end
end
