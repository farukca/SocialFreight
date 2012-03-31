class AddBranchidToLoadings < ActiveRecord::Migration
  def change
    change_table :loadings do |t|
      t.integer :branch_id, :null => false
    end
  end
end
