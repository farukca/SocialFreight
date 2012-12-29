class AddTransportIdToTransnodes < ActiveRecord::Migration
  def change
    add_column :transnodes, :transport_id, :integer, null: false
  end
end
