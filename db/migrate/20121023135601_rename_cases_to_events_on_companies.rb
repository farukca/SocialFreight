class RenameCasesToEventsOnCompanies < ActiveRecord::Migration

  def change
  	change_table :companies do |t|
  	  t.rename :cases_count, :events_count
  	end
  end
  
end
