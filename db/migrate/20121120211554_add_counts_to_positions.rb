class AddCountsToPositions < ActiveRecord::Migration
  def change
  	change_table :positions do |t|
  		t.integer :loadings_count, default: 0
  		t.integer :transports_count, default: 0
  		t.integer :documents_count, default: 0
  	end
  end
end
