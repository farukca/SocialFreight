class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations, :id => false do |t|
      t.string :code, :primary_key => true, :limit => 20
      t.string :name, :limit => 40, :null => false
      t.string :operation_type, :limit => 20, :null => false
    end
  end
end
