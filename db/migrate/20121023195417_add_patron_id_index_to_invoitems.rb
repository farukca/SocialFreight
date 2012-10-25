class AddPatronIdIndexToInvoitems < ActiveRecord::Migration
  def change
  	change_column  :invoitems, :patron_id, :integer, null: false
  end

  add_index        :invoitems, [:invoice_id, :patron_id]
  add_index        :invoitems, [:company_id, :patron_id]
  add_index        :invoitems, [:invoitem_owner_type, :invoitem_owner_id, :patron_id], name: "ixdex_on_invoitem_owner_patron"
end
