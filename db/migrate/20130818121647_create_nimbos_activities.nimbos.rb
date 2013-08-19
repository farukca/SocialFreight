# This migration comes from nimbos (originally 20130728100810)
class CreateNimbosActivities < ActiveRecord::Migration
  def change
    create_table :nimbos_activities do |t|
      t.integer  :user_id, :null => false
      t.string   :target_type, :limit => 40
      t.integer  :target_id
      t.string   :target_name, :limit => 60
      t.integer  :patron_id, :null => false
      t.integer  :branch_id
      
      t.timestamps
    end
    add_index :nimbos_activities, [:user_id, :patron_id]
  end
end
