# This migration comes from nimbos (originally 20130917033001)
class AddParentAndChannelToPosts < ActiveRecord::Migration
  def change
  	change_table :nimbos_posts do |t|
      t.string   :parent_type, limit: 40
      t.integer  :parent_id
      t.string   :parent_title
      t.string   :parent_url
      t.string   :post_action, limit: 50
      t.string   :channel, limit: 50
      t.boolean  :trashed, default: false
      t.integer  :comments_count, default: 0
      t.integer  :likes_count, default: 0
    end
  end
end
