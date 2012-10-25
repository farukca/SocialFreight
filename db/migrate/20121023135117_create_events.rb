class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :company_id, null: false
      t.date    :event_date, null: false
      t.string  :event_type, limit: 40, null: false
      t.string  :event_source, limit: 40
      t.string  :source_url, limit: 100
      t.string  :event_status, limit: 10
      t.text    :description
      t.integer :user_id, null: false
      t.integer :patron_id, null: false

      t.timestamps
    end
  end
end