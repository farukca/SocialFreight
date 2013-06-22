# This migration comes from assetim (originally 20130622094424)
class CreateAssetimWares < ActiveRecord::Migration
  def change
    create_table :assetim_wares do |t|
      t.string  :name, limit: 100, null: false
      t.string  :serial_no, limit: 100
      t.string  :barcode, limit: 30
      t.string  :location
      t.integer :branch_id
      t.string  :status, limit: 20
      t.text    :desc
      t.integer :patron_id, null: false

      t.timestamps
    end
  end
end
