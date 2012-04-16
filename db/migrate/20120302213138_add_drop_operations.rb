class AddDropOperations < ActiveRecord::Migration
  def change
    change_column :operations, :code, :string, :primary_key => true
  end
end
