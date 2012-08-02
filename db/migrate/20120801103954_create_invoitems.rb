class CreateInvoitems < ActiveRecord::Migration
  def change
    create_table :invoitems do |t|
      t.integer :invoice_id
      t.string  :unit_name, limit: 100, null: false
      t.string  :invoice_name, limit: 100
      t.integer :unit_number, default: 1, null: false
      t.decimal :unit_price, default: 0, null: false
      t.decimal :item_price, default: 0, null: false
      t.decimal :item_vat, default: 0, null: false
      t.string  :price_curr, limit: 10, null: false
      t.string  :status, limit: 10, null: false
      t.string  :credit_debit, limit: 10, null: false
      t.integer :company_id, null: false
      t.float   :vat_rate, default: 0, null: false
      t.float   :curr_rate, default: 1, null: false
      t.decimal :local_price, default: 0, null: false
      t.decimal :local_vat, default: 0, null: false
      t.string  :local_curr, limit: 10, null: false
      t.integer :branch_id, null: false
      t.string  :operation, limit: 20
      t.string  :service, limit: 10
      t.references :invoitem_owner, polymorphic: true
      t.string  :owner_reference, limit: 50
      t.integer :user_id, null: false
      t.boolean :approved
      t.integer :approver_id
      t.integer :patron_id
      t.text    :description

      t.timestamps
    end
  end
end
