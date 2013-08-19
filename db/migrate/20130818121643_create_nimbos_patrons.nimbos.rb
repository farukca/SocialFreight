# This migration comes from nimbos (originally 20130727074337)
class CreateNimbosPatrons < ActiveRecord::Migration

  def change
    create_table :nimbos_patrons do |t|
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
      t.string :city, :limit => 100
      t.string :state, :limit => 100
      t.string :country_id, :limit => 2
      t.string :patron_type, :limit => 20
      t.string :employees, :limit => 10
      t.string :language, :limit => 2
      t.string :status, :limit => 10, default: "active"
      t.string :logo
      t.string :patron_token, :limit => 40
      t.string :time_zone, :limit => 30
      t.string :district, :limit => 40
      t.string :currency, :limit => 10
      t.string :locale, :limit => 20
      t.string :mail_encoding, :limit => 20

      t.timestamps
    end
  end

end
