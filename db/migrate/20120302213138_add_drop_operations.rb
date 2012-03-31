class AddDropOperations < ActiveRecord::Migration
  def change
    remove_column :operations, :id
    change_column :operations, :code, :string, :primary_key => true
  end
end
