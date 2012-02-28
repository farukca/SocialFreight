class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string  :name, :limit => 40, :null => false
      t.string  :tel, :limit => 15
      t.string  :fax, :limit => 15
      t.string  :email, :limit => 40
      t.string  :postcode, :limit => 5
      t.string  :address, :limit => 80
      t.string  :district, :limit => 40
      t.integer :city_id
      t.integer :state_id
      t.integer :country_id
      t.string  :status, :limit => 1, :default => 'A'
      t.integer :patron_id, :null => false
      t.string  :patron_token, :limit => 20, :null => false
      t.float   :latitude
      t.float   :longitude
      t.boolean :gmaps
      t.string  :slug, :limit => 40

      t.timestamps
    end
    
    add_index :branches, [:patron_id, :patron_token]
  end
end
