class SetPositionOperationToNull < ActiveRecord::Migration
  def up
  	change_column(:positions, :operation, :string, null: true)
  	change_column(:positions, :direction, :string, null: true)
  end

  def down
  	change_column(:positions, :operation, :string, null: false)
  	change_column(:positions, :direction, :string, null: false)
  end
end
