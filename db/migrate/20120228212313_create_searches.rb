class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string  :model, :limit => 60
      t.string  :reference, :limit => 40
      t.string  :operation, :limit => 20
      t.string  :direction, :limit => 1
      t.string  :paid_at, :limit => 20
      t.string  :load_type, :limit => 1
      t.integer :agent_id
      t.integer :user_id, :null => false
      t.integer :branch_id
      t.date    :docdate1
      t.date    :docdate2
      t.integer :saler_id
      t.integer :driver_id
      t.integer :company_id
      t.integer :transporter_id
      t.string  :status, :limit => 4
      t.date    :report_date1
      t.date    :report_date2
      t.integer :country_id
      t.integer :city_id
      t.boolean :searched, :default => true
      t.integer :patron_id, :null => false
      t.string  :patron_token, :limit => 20, :null => false
      
      t.timestamps
    end

    add_index :searches, [:patron_id, :patron_token]
  end
end
