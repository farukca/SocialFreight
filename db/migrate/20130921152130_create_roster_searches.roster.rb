# This migration comes from roster (originally 20130921123127)
class CreateRosterSearches < ActiveRecord::Migration
  def change
    create_table :roster_searches do |t|
      t.string   :model, limit: 30, null: false
      t.string   :reference, limit: 40
      t.integer  :user_id, null: false
      t.integer  :patron_id, null: false
      t.string   :search_type, limit: 10, default: "detailed"
      t.hstore   :filter

      t.timestamps
    end

    add_index :roster_searches, [:patron_id, :user_id]
  end
end
