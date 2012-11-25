# This migration comes from blogger (originally 20121124184317)
class CreateBloggerArticles < ActiveRecord::Migration
  def change
    create_table :blogger_articles do |t|
      t.string :title, limit: 255, null: false
      t.text :content
      t.integer :author_id, null: false
      t.boolean :confirmed, default: false, null: false
      t.date :publish_date
      t.string :website, limit: 40
      t.integer :blog_comments_count, default: 0

      t.timestamps
    end
  end
end
