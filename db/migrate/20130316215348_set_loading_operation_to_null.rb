class SetLoadingOperationToNull < ActiveRecord::Migration
  def up
  	change_column(:loadings, :operation, :string, null: true)
  	change_column(:loadings, :direction, :string, null: true)
  end

  def down
  	change_column(:loadings, :operation, :string, null: false)
  	change_column(:loadings, :direction, :string, null: false)
  end
end
