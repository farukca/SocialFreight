class CreateTransnodes < ActiveRecord::Migration
  def change
    create_table :transnodes do |t|
      t.integer :position_id, :null => false
      t.string  :trans_method, :limit => 20, :null => false
      t.string  :voyage, :limit => 20
      t.string  :vessel, :limit => 20
      t.string  :truck,  :limit => 20      
      t.string  :driver, :limit => 50
      t.integer :transporter_id
      t.integer :forwarder_id
      t.integer :supplier_id
      t.string  :departure_place, :limit => 50
      t.timestamp :departure_date
      t.date    :departured_date
      t.string  :arrival_place, :limit => 50
      t.timestamp :arrival_date
      t.date    :arrived_date
      t.decimal :freight_price, :default => 0
      t.string  :freight_curr, :limit => 5
      t.string  :ticket_no, :limit => 20
      t.date    :ticket_date
      t.string  :doc1_no, :limit => 20
      t.string  :doc2_no, :limit => 20
      t.string  :doc3_no, :limit => 20
      t.string  :doc4_no, :limit => 20      
      t.string  :notes, :limit => 500

      t.timestamps
    end

    add_index :transnodes, :position_id
  end
end
