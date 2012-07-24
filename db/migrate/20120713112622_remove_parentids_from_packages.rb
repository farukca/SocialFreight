class RemoveParentidsFromPackages < ActiveRecord::Migration
  def up
  	remove_column :packages, :loading_id
  	remove_column :packages, :container_id
  end

  def down
  	add_column :packages, :loading_id, :integer, null: false
  	add_column :packages, :container_id, :integer
  end
end
