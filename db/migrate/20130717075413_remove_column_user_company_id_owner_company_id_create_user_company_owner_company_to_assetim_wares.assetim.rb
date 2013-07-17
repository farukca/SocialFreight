# This migration comes from assetim (originally 20130717074407)
class RemoveColumnUserCompanyIdOwnerCompanyIdCreateUserCompanyOwnerCompanyToAssetimWares < ActiveRecord::Migration
  def up
  	remove_column :assetim_wares, :user_company_id
  	remove_column :assetim_wares, :owner_company_id
  	add_column :assetim_wares, :owner_company, :string, :limit => 255
  	add_column :assetim_wares, :user_company, :string, :limit => 255
  end

  def down
  	add_column :assetim_wares, :user_company_id, :integer
  	add_column :assetim_wares, :owner_company_id, :integer
  	remove_column :assetim_wares, :owner_company
  	remove_column :assetim_wares, :user_company
  end
end
