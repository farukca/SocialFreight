class AddBranchToFindocs < ActiveRecord::Migration
  def change
    change_table :findocs do |t|
      t.integer :branch_id, :null => false
      t.string  :doc_group, :limit => 20
    end
  end
end
