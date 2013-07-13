# This migration comes from assetim (originally 20130711113226)
class AddOwnerCompanyUserCompanySupplierEntryDateInvoiceNoPriceCurrencyWarrantyDetailsToAssetimWares < ActiveRecord::Migration
  def change
    add_column :assetim_wares, :owner_company_id, :integer
    add_column :assetim_wares, :user_company_id, :integer
    add_column :assetim_wares, :supplier_id, :integer
    add_column :assetim_wares, :entry_date, :date
    add_column :assetim_wares, :invoice_no, :string, :limit => 25
    add_column :assetim_wares, :price, :float
    add_column :assetim_wares, :currency, :string, :limit => 10
    add_column :assetim_wares, :warranty, :string, :limit => 100
    add_column :assetim_wares, :details, :text
  end
end
