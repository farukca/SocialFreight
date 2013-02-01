class AddEventDetailsToEvents < ActiveRecord::Migration
  def change
  	change_table :events do |t|
  		t.string   :event_title, limit: 255
  		t.string   :event_hour, limit: 5
  		t.date     :finish_date
  	end
  end
end
