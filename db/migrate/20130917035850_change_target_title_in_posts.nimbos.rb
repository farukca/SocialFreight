# This migration comes from nimbos (originally 20130917032557)
class ChangeTargetTitleInPosts < ActiveRecord::Migration
  def up
  	change_column(:nimbos_posts, :target_name, :string, limit: 255)
  	change_column(:nimbos_posts, :post_type, :string, limit: 255)
  	rename_column(:nimbos_posts, :target_name, :target_title)
  	rename_column(:nimbos_posts, :post_type, :target_url)
  end

  def down
  	rename_column(:nimbos_posts, :target_title, :target_name)
  	rename_column(:nimbos_posts, :target_url, :post_type)
  end
end
