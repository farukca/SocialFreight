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
      t.string  :jobtitle, :limit => 40
      t.string  :department, :limit => 60
      t.string  :tel2, :limit => 20
      t.string  :fax, :limit => 20
      t.date    :birthdate
      t.integer :patron_id
      t.string  :patron_token, :limit => 20
      t.string  :twitter, :limit => 50
      t.string  :facebook, :limit => 50
      t.string  :linkedin, :limit => 50
      t.string  :des, :limit => 255
      t.string  :slug, :limit => 60

      t.timestamps
    end
    add_index :contacts, [ :company_id, :user_id ]
  end
end
