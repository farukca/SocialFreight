# This migration comes from nimbos (originally 20130908193655)
class CreateNimbosDiscussions < ActiveRecord::Migration
  def change
    create_table :nimbos_discussions do |t|
      t.string  :title, null: false, limit: 255
      t.text    :content
      t.string  :target_type, limit: 50
      t.integer :target_id
      t.integer :user_id, null: false
      t.integer :patron_id, null: false

      t.timestamps
    end
  end
end
