# This migration comes from assetim (originally 20130709141022)
class AddGroupModelDebitNoToWares < ActiveRecord::Migration
  def change
    add_column :assetim_wares, :group, :string, :limit => 50
    add_column :assetim_wares, :trademark, :string, :limit => 50
    add_column :assetim_wares, :model, :string, :limit => 255
    add_column :assetim_wares, :debit_no, :string, :limit => 20
  end
end
