class AddOperationsToPatrons < ActiveRecord::Migration
  def change
    change_table :patrons do |t|
      t.string :time_zone, :limit => 30
      t.string :district, :limit => 40
      t.string :currency, :limit => 10
      t.string :operations, :limit => 100
      t.boolean :vehicle_owner, :default => false
      t.boolean :depot_owner, :default => false
      t.string :iata_code, :limit => 30
      t.string :fmc_code, :limit => 30
    end
  end
end
