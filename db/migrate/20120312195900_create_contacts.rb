class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string  :name, :limit => 30
      t.string  :surname, :limit => 30, :null => false
      t.integer :company_id
      t.integer :user_id, :null => false
      t.string  :salutation, :limit => 5
      t.string  :email, :limit => 90
      t.string  :tel, :limit => 15
      t.string  :gsm, :limit => 15
      t.string  :twitter, :limit => 50
      t.string  :facebook, :limit => 50
      t.string  :linkedin, :limit => 50
      
      t.timestamps
    end
  end
end
