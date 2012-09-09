class AddContainerNoToPackages < ActiveRecord::Migration
  def change
  	change_table :packages do |t|
  	  t.string  :container_no, limit: 40
  	end
  end
end
