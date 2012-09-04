class AddSenderToLoadings < ActiveRecord::Migration
  def change
  	change_table :loadings do |t|
  	  t.integer  :sender_id
  	  t.integer  :consignee_id
  	  t.integer  :creater_id
  	  t.integer  :updater_id
  	end
  end
end
