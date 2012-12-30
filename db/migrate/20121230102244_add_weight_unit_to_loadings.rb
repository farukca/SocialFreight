class AddWeightUnitToLoadings < ActiveRecord::Migration
  def change
    add_column :loadings, :weight_unit, :string, :limit => 20
  end
end
