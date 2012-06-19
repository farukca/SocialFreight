class CreateLoadings < ActiveRecord::Migration
  def change
    create_table :loadings do |t|
      t.string  :reference, :limit => 30, :null => false
      t.integer :position_id
      t.string  :operation, :limit => 20, :null => false
      t.string  :direction, :limit => 1, :null => false
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
      t.integer :bank_id
      t.string  :producer, :limit => 60
      t.string  :marks_nos, :limit => 50
      t.string  :hts_no, :limit => 20
      t.float   :brut_wg
      t.float   :volume
      t.float   :ladameter
      t.float   :price_wg
      t.integer :patron_id, :null => false
      t.string  :patron_token, :limit => 20, :null => false
      t.string  :commodity, :limit => 500
      t.string  :notes, :limit => 500
      t.string  :load_coun, :limit => 2
      t.string  :unload_coun, :limit => 2
      t.string  :status, :limit => 1, :default => 'A'
      t.string  :stage, :limit => 4
      t.timestamp :stage_date
      
      t.timestamps
    end
    
    add_index :loadings, [:reference, :patron_id, :patron_token], :unique => true
    add_index :loadings, [:patron_id, :patron_token, :branch_id]
    add_index :loadings, :position_id
    add_index :loadings, [:operation, :direction]
    add_index :loadings, [:company_id, :load_coun, :unload_coun]
  end
end
