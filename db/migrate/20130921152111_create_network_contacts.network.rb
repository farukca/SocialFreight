# This migration comes from network (originally 20130921094436)
class CreateNetworkContacts < ActiveRecord::Migration
  def change
    create_table :network_contacts do |t|
      t.string   :name, :limit => 50
      t.string   :surname, :limit => 50, :null => false
      t.integer  :company_id
      t.integer  :user_id, :null => false
      t.string   :salutation, :limit => 10
      t.string   :email, :limit => 100
      t.string   :tel, :limit => 30
      t.string   :gsm, :limit => 30
      t.string   :jobtitle, :limit => 100
      t.string   :department, :limit => 60
      t.string   :tel2, :limit => 30
      t.string   :fax, :limit => 30
      t.date     :birthdate
      t.integer  :patron_id
      t.string   :twitter, :limit => 50
      t.string   :facebook, :limit => 50
      t.string   :linkedin, :limit => 50
      t.string   :des, :limit => 255
      t.string   :slug, :limit => 60

      t.timestamps
    end
    add_index :network_contacts, [:company_id, :user_id]
    add_index :network_contacts, :patron_id
  end
end
