class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email, :null => false, :limit => 40
      t.string  :crypted_password
      t.string  :salt
      t.string  :name, :limit => 40
      t.string  :surname, :limit => 40
      t.integer :patron_id
      t.string  :patron_key, :limit => 20
      t.string  :language,  :default => 'en'
      t.string  :time_zone, :default => "Eastern Time (US & Canada)"
      t.string  :locale, :limit => 8
      t.string  :region, :limit => 2
      t.string  :user_type, :limit => 2
      t.string  :mail_encoding, :limit => 20
      t.timestamp  :last_login_at
      t.timestamp  :last_logout_at
      t.timestamp  :last_activity_at
      t.string  :activation_state
      t.string  :activation_token
      t.timestamp  :activation_token_expires_at
      t.string  :password_reset_token
      t.timestamp  :password_reset_email_time
      t.timestamp  :password_reset_token_expires_at
      t.integer  :failed_logins_count
      t.integer  :lock_expires_at
      t.string   :role
      t.string   :avatar
      t.string   :slug

      t.timestamps
    end
    
    add_index :users, :email, :unique => true
    add_index :users, [:patron_id, :patron_key]
    add_index :users, :slug, :unique => true
  end
  
end
