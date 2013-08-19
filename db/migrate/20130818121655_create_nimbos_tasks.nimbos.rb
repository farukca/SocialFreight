# This migration comes from nimbos (originally 20130817183906)
class CreateNimbosTasks < ActiveRecord::Migration
  def change
    create_table :nimbos_tasks do |t|
      t.integer  :todolist_id, null: false
      t.integer  :user_id, null: false
      t.string   :task_text, null: false, limit: 255
      t.string   :task_code, limit: 50
      t.string   :i18n_code, limit: 50
      t.integer  :cruser_id
      t.string   :status, limit: 10, default: "active"
      t.date     :due_date
      t.date     :closed_date
      t.string   :close_text, limit: 255
      t.boolean  :system_task, default: false
      t.integer  :patron_id, null: false

      t.timestamps
    end
  end
end
