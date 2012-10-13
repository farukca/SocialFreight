class AddWaybillNoToLoadings < ActiveRecord::Migration
  def change
  	change_table :loadings do |t|
  	  t.string   :waybill_no, limit: 60
  	  t.date     :waybill_date
  	end
  end
end
