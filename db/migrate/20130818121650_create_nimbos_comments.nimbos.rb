# This migration comes from nimbos (originally 20130810083034)
class CreateNimbosComments < ActiveRecord::Migration
  def change
    create_table :nimbos_comments do |t|
      t.integer  :user_id, null: false
      t.text     :comment_text, null: false
      t.string   :commentable_type, limit: 40
      t.integer  :commentable_id
      t.string   :commenter, limit: 1, default: "U"
      t.integer  :patron_id, null: false

      t.timestamps
    end
  end
end
