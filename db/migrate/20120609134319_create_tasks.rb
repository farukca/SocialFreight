class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer  :user_id, null: false
      t.string   :task_text, null: false, :limit => 1000
      t.string   :task_code, :limit => 50
      t.string   :i18n_code, :limit => 50
      t.integer  :cruser_id
      t.string   :status, :limit => 1, :default => "A"
      t.date     :due_date
      t.date     :closed_date
      t.string   :close_text
      t.boolean  :system_task, default: false
      t.integer  :patron_id, null: false

      t.timestamps
    end
    add_index :tasks, [:user_id, :status, :patron_id], :name => "user_tasks"
  end
end
