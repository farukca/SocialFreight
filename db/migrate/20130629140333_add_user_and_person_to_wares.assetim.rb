# This migration comes from assetim (originally 20130629132818)
class AddUserAndPersonToWares < ActiveRecord::Migration
  def change
    add_column :assetim_wares, :user_id, :integer
    add_column :assetim_wares, :person_id, :integer
  end
end
