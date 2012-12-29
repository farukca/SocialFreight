class AddPatronIdToTransnodes < ActiveRecord::Migration
  def change
  	change_table :transnodes do |t|
  		t.integer :patron_id, null: false
  	end
  end
end
