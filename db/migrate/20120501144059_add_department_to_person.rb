class AddDepartmentToPerson < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.string :department, :limit => 40
    end    
  end
end
