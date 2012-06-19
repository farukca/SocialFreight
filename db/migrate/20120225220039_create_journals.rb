class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.date    :process_date, :null => false
      t.string  :journal_model, :limit => 40
      t.string  :journaled_type, :limit => 40
      t.integer :journaled_id, :null => false
      t.integer :unit, :default => 0
      t.decimal :amount, :default => 0
      t.integer :patron_id, :null => false
      t.string  :patron_token, :limit => 20
    end

    add_index :journals, [:patron_id, :journaled_type, :journaled_id]
  end
end
