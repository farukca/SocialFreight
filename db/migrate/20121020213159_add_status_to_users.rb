class AddStatusToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  	  t.string :user_status, limit: 1, default: 'A'
  	end
  end
end
