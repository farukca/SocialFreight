class AddWaybillflagToTransport < ActiveRecord::Migration
  def change
  	change_table :transports do |t|
      t.boolean :waybill_flag, :default => false
      t.integer :user_id, :null => false
    end
  end
end
