class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  attr_accessible :comment_text, :commenter, :commentable, :user_id

  validates_presence_of :comment_text, :user_id

  default_scope { where(patron_id: Patron.current_id) }

  after_create :add_post

  def self.log(user_id, target, target_name, commenter)
    
    msg_text = 'created this ' + target.class.name.downcase

    comment = Comment.new(commentable: target, user_id: user_id, comment_text: msg_text, commenter: commenter)

    comment.save!
    comment
  end

  private
  def add_post
    Post.log(user_id, commentable, commentable.to_s, comment_text, true)
  end

end
