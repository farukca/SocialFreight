class AddBranchIdToTransports < ActiveRecord::Migration
  def change
  	change_table :transports do |t|
  		t.integer :branch_id
  	end
  end
end
