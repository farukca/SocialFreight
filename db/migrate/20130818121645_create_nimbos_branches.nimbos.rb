# This migration comes from nimbos (originally 20130728094121)
class CreateNimbosBranches < ActiveRecord::Migration
  def change
    create_table :nimbos_branches do |t|
      t.string  :name, :limit => 40, :null => false
      t.string  :tel, :limit => 15
      t.string  :fax, :limit => 15
      t.string  :email, :limit => 40
      t.string  :postcode, :limit => 5
      t.string  :address, :limit => 80
      t.string  :district, :limit => 40
      t.string  :city, :limit => 100
      t.string  :state, :limit => 100
      t.string  :country_id, :limit => 2
      t.string  :status, :limit => 10, :default => 'active'
      t.integer :patron_id, :null => false
      t.float   :latitude
      t.float   :longitude
      t.boolean :gmaps

      t.timestamps
    end
    
    add_index :nimbos_branches, :patron_id
  end
end
