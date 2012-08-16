class AddParentIdToCompanies < ActiveRecord::Migration
  def change
  	change_table :companies do |t|
  	  t.integer  :parent_id
  	  t.integer  :updater_id
   	end
  end
end
