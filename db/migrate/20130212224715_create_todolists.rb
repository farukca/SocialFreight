class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
      t.string  :name, limit: 255, null: false
      t.integer :user_id, null: false
      t.string  :todop_type, limit: 100
      t.integer :todop_id
      t.integer :patron_id, null: false
      t.integer :tasks_count, default: 0
      t.boolean :trashed, default: false

      t.timestamps
    end
  end
end
