class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string  :reference, :limit => 30, :null => false
      t.string  :operation, :limit => 20, :null => false
      t.string  :direction, :limit => 1, :null => false
      t.string  :incoterm, :limit => 20
      t.string  :paid_at, :limit => 20
      t.string  :load_type, :limit => 1
      t.integer :agent_id
      t.integer :user_id, :null => false
      t.integer :load_place_id
      t.timestamp :load_date
      t.integer :unload_place_id
      t.timestamp :unload_date
      t.decimal :freight_price, :default => 0
      t.string  :freight_curr, :limit => 5
      t.string  :status, :limit => 4
      t.date    :report_date
      t.string  :stage, :limit => 4
      t.timestamp :stage_date
      t.string  :ref_no1, :limit => 20
      t.string  :ref_type1, :limit => 2
      t.string  :ref_no2, :limit => 20
      t.string  :ref_type2, :limit => 2
      t.string  :ref_no3, :limit => 20
      t.string  :ref_type3, :limit => 2
      t.string  :ref_no4, :limit => 20
      t.string  :ref_type4, :limit => 2
      t.string  :slug, :limit => 40
      t.string  :notes, :limit => 500
      t.integer :patron_id, :null => false
      t.string  :patron_token, :limit => 20, :null => false
      
      t.timestamps
    end

    add_index :positions, [:reference, :patron_id, :patron_token], :unique => true
    add_index :positions, [:patron_id, :patron_token]
  end
end
