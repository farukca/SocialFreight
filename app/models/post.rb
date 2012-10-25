class Post < ActiveRecord::Base

  acts_as_mentioner

  belongs_to :user
  belongs_to :target, polymorphic: true

  has_many :comments, as: :commentable, dependent: :destroy

  attr_accessible :message, :post_type, :target_name, :target, :user_id, :is_private, :is_syspost

  validates_presence_of :user_id, :message

  default_scope { where(patron_id: Patron.current_id) }
  scope :latests, order("created_at desc")

  def self.log(user_id, target, target_name, action_text, syspost_flag)

    private_post = true

    post = Post.new(target: target, user_id: user_id, target_name: target_name, message: action_text, is_private: private_post, is_syspost: syspost_flag)

    post.save!
    
    post
  end

end
