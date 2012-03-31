class AddPriceToPositions < ActiveRecord::Migration
  def change
    change_table :positions do |t|
      t.decimal :agent_price, :default => 0.0
      t.string  :agent_curr, :limit => 3
    end
  end
end
