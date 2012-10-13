class AddCountersToCompanies < ActiveRecord::Migration
  def change
  	change_table :companies do |t|
  	  t.string   :city, limit: 40
  	  t.string   :state, limit: 40
  	  t.integer  :contacts_count, default: 0
  	  t.integer  :cases_count, default: 0
  	  t.integer  :partners_count, default: 0
  	end
  end
end
