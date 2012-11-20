class AddCountsToLoadings < ActiveRecord::Migration
  def change
  	change_table :loadings do |t|
  		t.integer :departures_count, default: 0
  		t.integer :arrivals_count, default: 0
  		t.integer :containers_count, default: 0
  		t.integer :packages_count, default: 0
  		t.integer :documents_count, default: 0
  	end
  end
end
