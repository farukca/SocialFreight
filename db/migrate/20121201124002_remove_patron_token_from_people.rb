class RemovePatronTokenFromPeople < ActiveRecord::Migration
  def up
    remove_column :people, :patron_token
    remove_column :people, :email
  end

  def down
    add_column :people, :patron_token, :string, limit: 40
    add_column :people, :email, :string, limit: 40
  end
end
