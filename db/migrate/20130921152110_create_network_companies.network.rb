# This migration comes from network (originally 20130921091648)
class CreateNetworkCompanies < ActiveRecord::Migration
  def change
    create_table :network_companies do |t|
      t.string   :name, :limit => 50, :null => false
      t.string   :title, :limit => 255
      t.string   :company_type, :limit => 10
      t.string   :tel, :limit => 30
      t.string   :fax, :limit => 30
      t.string   :gsm, :limit => 30
      t.string   :voip, :limit => 30
      t.string   :email, :limit => 100
      t.string   :website, :limit => 255
      t.string   :sector, :limit => 40
      t.string   :postcode, :limit => 5
      t.string   :address, :limit => 255
      t.string   :district, :limit => 100
      t.string   :city, :limit => 100
      t.string   :state, :limit => 100
      t.string   :country_id, :limit => 2
      t.string   :status, :limit => 10, :default => 'active'
      t.integer  :branch_id, null: false
      t.integer  :patron_id, :null => false
      t.float    :latitude
      t.float    :longitude
      t.boolean  :gmaps
      t.text     :notes
      t.integer  :saler_id
      t.integer  :user_id, :null => false
      t.string   :company_no, limit: 10
      t.string   :slug, :limit => 50
		  t.integer  :contacts_count, default: 0
  		t.integer  :events_count, default: 0
  		t.integer  :partners_count, default: 0
  		t.integer  :discussions_count, default: 0

      t.timestamps
    end
    
    add_index :network_companies, [:name, :patron_id], :unique => true
    add_index :network_companies, :patron_id
  end
end
