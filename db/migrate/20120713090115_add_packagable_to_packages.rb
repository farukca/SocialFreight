class AddPackagableToPackages < ActiveRecord::Migration
  def change
  	change_table :packages do |t|
  	  t.references :packed, polymorphic: true
  	end

  	add_index :packages, [:packed_type, :packed_id], name: "index_packages_parent"
  end
end
