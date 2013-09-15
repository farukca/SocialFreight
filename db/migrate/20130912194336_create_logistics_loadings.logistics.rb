# This migration comes from logistics (originally 20130911201253)
class CreateLogisticsLoadings < ActiveRecord::Migration
  def change
    create_table :logistics_loadings do |t|
      t.string  :reference, :limit => 30, :null => false
      t.integer :position_id
      t.string  :incoterm, :limit => 20
      t.string  :paid_at, :limit => 20
      t.string  :channel, :limit => 30
      t.string  :load_type, :limit => 1
      t.integer :branch_id, :null => false
      t.integer :company_id, :null => false
      t.integer :agent_id
      t.integer :user_id, :null => false
      t.integer :saler_id
      t.decimal :freight_price, :default => 0
      t.string  :freight_curr, :limit => 5
      t.decimal :agent_price, :default => 0
      t.string  :agent_curr
      t.float   :agent_share
      t.decimal :product_price, :default => 0
      t.string  :product_curr
      t.string  :slug, :limit => 40
      t.boolean :bank_flag
      t.string  :bank, limit: 100
      t.string  :producer, :limit => 60
      t.string  :marks_nos, :limit => 50
      t.string  :hts_no, :limit => 20
      t.float   :brut_wg
      t.float   :volume
      t.float   :ladameter
      t.float   :price_wg
      t.string	:weight_unit, limit: 20
      t.integer :patron_id, :null => false
      t.boolean :trashed, default: false
      t.text    :commodity
      t.text    :notes
      t.string  :load_coun, :limit => 2
      t.string  :unload_coun, :limit => 2
      t.string  :status, :limit => 10, :default => 'active'
      t.string  :sender
		  t.string  :consignee
		  t.string  :category, limit: 60
		  t.integer :departures_count, default: 0
		  t.integer :arrivals_count, default: 0
		  t.integer :containers_count, default: 0
		  t.integer :packages_count, default: 0
		  t.integer :documents_count, default: 0

      t.timestamps
    end
    
    add_index :logistics_loadings, [:reference, :patron_id], :unique => true
    add_index :logistics_loadings, [:patron_id, :branch_id]
    add_index :logistics_loadings, [:patron_id, :position_id]
    add_index :logistics_loadings, [:patron_id, :company_id]
  end
end
