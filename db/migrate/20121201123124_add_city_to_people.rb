class AddCityToPeople < ActiveRecord::Migration
  def change
    add_column :people, :city, :string, :limit => 60
    add_column :people, :state, :string, :limit => 60
  end
end
