class CreateFinunits < ActiveRecord::Migration
  def change
    create_table :finunits do |t|
      t.string  :name, :limit => 50, :null => false
      t.string  :curr, :limit => 5, :null => false
      t.string  :unit_type, :limit => 10, :null => false
      t.integer :branch_id
      t.integer :bank_id
      t.string  :bank_branch, :limit => 30
      t.string  :account, :limit => 20
      t.string  :iban, :limit => 50
      t.integer :person_id
      t.integer :patron_id, :null => false
      t.string  :patron_token, :null => false

      t.timestamps
    end

    add_index :finunits, [:patron_id, :branch_id, :unit_type]
  end
end
