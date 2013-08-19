# This migration comes from nimbos (originally 20130728104058)
class RenameCryptedToDigestUser < ActiveRecord::Migration
  def up
  	rename_column :nimbos_users, :crypted_password, :password_digest
  end

  def down
  	rename_column :nimbos_users, :password_digest, :crypted_password
  end
end
