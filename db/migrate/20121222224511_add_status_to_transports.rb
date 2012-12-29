class AddStatusToTransports < ActiveRecord::Migration
  def change
  	change_table :transports do |t|
      t.string :status, limit: 1, default: "A"
  	end
  end
end
