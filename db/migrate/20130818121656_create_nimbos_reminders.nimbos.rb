# This migration comes from nimbos (originally 20130817184424)
class CreateNimbosReminders < ActiveRecord::Migration
  def change
    create_table :nimbos_reminders do |t|
      t.string   :title, null: false, limit: 255
      t.date     :start_date, null: false
      t.string   :start_hour, limit: 5
      t.date     :finish_date
      t.string   :calendar_scope, limit: 40
      t.text     :description
      t.string   :remindfor_type, limit: 100
      t.integer  :remindfor_id
      t.integer  :user_id, null: false
      t.integer  :patron_id, null: false
      t.boolean  :trashed, default: false

      t.timestamps
    end
  end
end
