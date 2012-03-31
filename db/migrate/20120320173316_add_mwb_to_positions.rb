class AddMwbToPositions < ActiveRecord::Migration
  def change
    change_table :positions do |t|
      t.string :waybill_no, :limit => 30
      t.date :waybill_date
    end
  end
end
