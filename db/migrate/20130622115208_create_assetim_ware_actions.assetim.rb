# This migration comes from assetim (originally 20130622101858)
class CreateAssetimWareActions < ActiveRecord::Migration
  def change
    create_table :assetim_ware_actions do |t|
      t.integer  :ware_id, null: false
      t.date     :action_date, null: false
      t.string   :title, null: false, limit: 255
      t.string   :action_type, limit: 30, null: false
      t.text     :desc
      t.integer  :user_id, null: false
      t.integer  :patron_id, null: false

      t.timestamps
    end
  end
end
