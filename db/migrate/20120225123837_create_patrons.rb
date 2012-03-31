class CreatePatrons < ActiveRecord::Migration

  def change
    create_table :patrons do |t|
      t.string :name, :limit => 40, :null => false
      t.string :title, :limit => 60
      t.string :email, :limit => 60, :null => false
      t.string :website, :limit => 60
      t.string :tel, :limit => 20
      t.string :fax, :limit => 20
      t.string :gsm, :limit => 20
      t.string :postcode, :limit => 5
      t.string :address, :limit => 60
      t.string :contact_name, :limit => 40
      t.string :contact_surname, :limit => 40
      t.integer :city_id
      t.integer :state_id
      t.integer :country_id
      t.string :patron_type, :limit => 20
      t.string :employees, :limit => 10
      t.string :language, :limit => 2
      t.string :status, :limit => 1, default: "A"
      t.string :logo

      t.timestamps
    end
  end

end
