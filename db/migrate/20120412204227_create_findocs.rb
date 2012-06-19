class CreateFindocs < ActiveRecord::Migration
  def change
    create_table :findocs do |t|
      t.date    :docdate, :null => false
      t.float   :amount, :null => false, :default => 0
      t.string  :curr, :limit => 3, :null => false
      t.float   :rate
      t.float   :rate_amount, :default => 0
      t.string  :rate_type, :limit => 3
      t.string  :unit_type, :limit => 3, :null => false
      t.integer :unit_id, :null => false
      t.string  :unit_name, :limit => 50
      t.string  :process_type, :limit => 10
      t.string  :target_type, :limit => 3
      t.integer :target_id
      t.string  :target_name, :limit => 50
      t.string  :docno, :limit => 10
      t.string  :extno, :limit => 20
      t.string  :doctype, :limit => 10
      t.string  :des, :limit => 100
      t.boolean :glstatus, :default => false
      t.integer :gldocno
      t.integer :user_id, :null => false
      t.integer :branch_id, :null => false
      t.string  :doc_group, :limit => 20
      t.integer :patron_id, :null => false, :null => false
      t.string  :patron_token, :limit => 40, :null => false

      t.timestamps
    end

    add_index :findocs, [:patron_id, :branch_id, :docdate, :doctype], :name => "index_findocs_of_patron_branch"
  end
end
