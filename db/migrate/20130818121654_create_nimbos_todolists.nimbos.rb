# This migration comes from nimbos (originally 20130817183341)
class CreateNimbosTodolists < ActiveRecord::Migration
  def change
    create_table :nimbos_todolists do |t|
      t.string   :name, null: false, limit: 255
      t.integer  :user_id, null: false
      t.string   :todop_type, limit: 100
      t.integer  :todop_id
      t.integer  :patron_id, null: false
      t.integer  :tasks_count, default: 0
      t.boolean  :trashed, default: false

      t.timestamps
    end
    add_index :nimbos_todolists, :user_id
  end
end
