class AddPatronIdIndexToNicks < ActiveRecord::Migration
  def change
  	change_column :nicks, :patron_id, :integer, null: false
  	add_index     :nicks, [:nicknamed_type, :nicknamed_id, :patron_id]
  end
end
