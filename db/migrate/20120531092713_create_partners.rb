class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.integer :company_id, :null => false
      t.integer :partner_id, :null => false
      t.integer :user_id, :null => false
      t.string  :partner_type, :limit => 20, :null => false
      t.string  :notes

      t.timestamps
    end
    add_index :partners, ["company_id", "partner_id", "partner_type"], :name => "company_partner_unique_index", :unique => true
    add_index :partners, :company_id
  end
end
