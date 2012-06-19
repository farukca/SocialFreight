class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string  :name, :limit => 50, :null => false
      t.string  :title, :limit => 100
      t.string  :company_type, :limit => 5
      t.string  :tel, :limit => 15
      t.string  :fax, :limit => 15
      t.string  :gsm, :limit => 15
      t.string  :voip, :limit => 15
      t.string  :website, :limit => 30
      t.string  :contact, :limit => 40
      t.string  :sector, :limit => 40
      t.string  :email, :limit => 40
      t.string  :postcode, :limit => 5
      t.string  :address, :limit => 80
      t.string  :district, :limit => 40
      t.integer :city_id
      t.integer :state_id
      t.string  :country_id, :limit => 2
      t.string  :status, :limit => 1, :default => 'A'
      t.integer :branch_id
      t.integer :patron_id, :null => false
      t.string  :patron_token, :limit => 20, :null => false
      t.float   :latitude
      t.float   :longitude
      t.boolean :gmaps
      t.string  :twitter_url, :limit => 30
      t.string  :facebook_url, :limit => 50
      t.string  :linkedin_url, :limit => 50
      t.string  :notes, :limit => 250
      t.string  :description, :limit => 250
      t.integer :saler_id
      t.integer :user_id, :null => false
      t.integer :company_no
      t.string  :slug, :limit => 40

      t.timestamps
    end
    
    add_index :companies, [:name, :patron_id, :patron_token], :unique => true
    add_index :companies, [:patron_id, :patron_token]
  end
end
