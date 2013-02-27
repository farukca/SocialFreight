class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string   :title, limit: 255, null: false
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
    add_index :reminders, [:user_id, :patron_id]
    add_index :reminders, [:remindfor_type, :remindfor_id]
  end
end
