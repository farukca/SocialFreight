# This migration comes from logistics (originally 20130911202930)
class CreateLogisticsPackages < ActiveRecord::Migration
  def change
    create_table :logistics_packages do |t|
      t.integer  :loading_id, :null => false
      t.string   :pack_type, :null => false
      t.integer  :total, :default => 0
      t.integer  :dimension1
      t.integer  :dimension2
      t.integer  :dimension3
      t.float    :brutwg, :default => 0
      t.float    :netwg, :default => 0
      t.float    :volume, :default => 0
      t.float    :lada, :default => 0
      t.string	 :weight_unit, limit: 20
      t.string   :imo, :limit => 20
      t.string   :gtip, :limit => 20
      t.string   :po, :limit => 20
      t.string   :container_no, limit: 40
      t.integer  :patron_id, null: false
      t.boolean :trashed, default: false
      t.text     :description
      t.text     :loading_notes

      t.timestamps
    end

    add_index :logistics_packages, [:loading_id, :patron_id]
  end
end
