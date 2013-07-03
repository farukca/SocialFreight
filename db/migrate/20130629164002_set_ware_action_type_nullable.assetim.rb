# This migration comes from assetim (originally 20130629163456)
class SetWareActionTypeNullable < ActiveRecord::Migration
  def up
  	change_column :assetim_ware_actions, :action_type, :string, null: true
  end

  def down
  	change_column :assetim_ware_actions, :action_type, :string, null: false
  end
end
