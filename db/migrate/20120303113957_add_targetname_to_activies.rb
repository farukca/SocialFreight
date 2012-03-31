class AddTargetnameToActivies < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.string :target_name, :limit => 60
    end
  end
end
