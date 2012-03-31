class AddBranchToPositions < ActiveRecord::Migration
  def change
    change_table :positions do |t|
      t.integer :branch_id, :null => false
    end
  end
end
