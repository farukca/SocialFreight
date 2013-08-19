# This migration comes from nimbos (originally 20130727090022)
class CreateNimbosUsers < ActiveRecord::Migration
  def change
    create_table :nimbos_users do |t|
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
      t.string     :activation_state
      t.string     :activation_token
      t.timestamp  :activation_token_expires_at
      t.string     :password_reset_token
      t.timestamp  :password_reset_email_time
      t.timestamp  :password_reset_token_expires_at
      t.integer  :failed_logins_count
      t.integer  :lock_expires_at
      t.string   :role
      t.string   :avatar
      t.integer  :branch_id, :null => false, :default => 0
      t.string   :remember_me_token, :default => nil
      t.string   :remember_me_token_expires_at, :datetime, :default => nil
      t.boolean  :firstuser, default: false
      t.string   :user_status, limit: 10, default: 'active'

      t.timestamps
    end

    add_index :nimbos_users, :email, :unique => true
    add_index :nimbos_users, :patron_id
    add_index :nimbos_users, :remember_me_token
  end
end
