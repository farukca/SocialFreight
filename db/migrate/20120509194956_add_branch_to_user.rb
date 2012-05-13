class AddBranchToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :branch_id, :null => false, :default => 0
    end
  end
end
