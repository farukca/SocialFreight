class AddFirstuserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstuser, :boolean, default: false
  end
end
