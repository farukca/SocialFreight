class CorrenctContainerName < ActiveRecord::Migration
  def up
  	remove_column :containers, :name
  	add_column :containers, :name, :string, limit: 30, null: false
  	add_column :containers, :due_date, :date
  end

  def down
  	remove_column :containers, :due_date
  end
end
