class AddUserToCompanies < ActiveRecord::Migration
  def change
    change_table :companies do |t|
      t.integer :user_id, :null => false
    end
  end
end
