class AddPayoffIdToCosts < ActiveRecord::Migration
  def change
  	change_table :costs do |t|
  	  t.integer :payoff_id
  	end
    add_index :costs, :payoff_id, :name => "index_payoffs_costs"
    add_index :costs, [:costable_type, :costable_id], :name => "index_costable_costs"
    add_index :costs, :owner_id, :name => "index_owners_costs"
    add_index :costs, [:truck, :vehicle], :name => "index_trucks_costs"
  end
end
