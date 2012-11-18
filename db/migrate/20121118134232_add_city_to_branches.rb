class AddCityToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :city, :string, limit: 100
  end
end
