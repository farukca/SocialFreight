class AddBrachIdToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :branch_id, :integer, default: 0
    add_index  :activities, [:branch_id, :patron_id]
  end
end
