class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.integer :company_id, null: false
      t.date    :case_date, null: false
      t.string  :case_type, limit: 40, null: false
      t.string  :case_source, limit: 40
      t.string  :source_url, limit: 100
      t.string  :case_status, limit: 10
      t.text    :description
      t.integer :user_id, null: false
      t.integer :patron_id, null: false

      t.timestamps
    end
  end
end
