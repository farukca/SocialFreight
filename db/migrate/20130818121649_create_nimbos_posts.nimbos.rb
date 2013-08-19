# This migration comes from nimbos (originally 20130810074252)
class CreateNimbosPosts < ActiveRecord::Migration
  def change
    create_table :nimbos_posts do |t|
      t.integer :user_id, null: false
      t.text    :message, null: false
      t.string  :target_type, limit: 40
      t.integer :target_id
      t.string  :target_name, limit: 40
      t.string  :post_type, limit: 20
      t.boolean :is_private, default: false
      t.boolean :is_syspost, default: false
      t.integer :patron_id, null: false

      t.timestamps
    end
  end
end
