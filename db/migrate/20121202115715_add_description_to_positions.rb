class AddDescriptionToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :description, :string, limit: 255
  end
end
