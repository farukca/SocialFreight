class CreateWaybills < ActiveRecord::Migration
  def change
    create_table :waybills do |t|
      t.string  :reference, :limit => 40
      t.string  :waybill_type, :limit => 1
      t.string  :copy_flag, :limit => 1
      t.string  :waybill_page, :limit => 4
      t.string  :waybillable_type, :limit => 40
      t.integer :waybillable_id

      t.timestamps
    end
  end
end
