# This migration comes from assetim (originally 20130629133537)
class AddCompanyAndPersonToWareActions < ActiveRecord::Migration
  def change
    add_column :assetim_ware_actions, :company, :string, :limit => 255
    add_column :assetim_ware_actions, :person_id, :integer
  end
end
