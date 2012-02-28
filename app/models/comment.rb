class Comment < ActiveRecord::Base
  #include Mongoid::Document
  #include Mongoid::Timestamps

  #field :comment_text
  #field :patron_token
  #field :commenter, default: "U"
  belongs_to :user
  belongs_to :patron
  belongs_to :commentable, polymorphic: true

  attr_accessible :comment_text, :commenter, :commentable, :user_id, :patron_id, :patron_token

  validates_presence_of :comment_text, :user_id, :patron_token, :patron_id

  after_create :add_post

  def self.log(user, target, target_name, patron_id, patron_token, commenter)
    patron_id ||= user.patron_id
    patron_token ||= user.patron.token
    msg_text = 'created this ' + target.class.name.downcase

    comment = Comment.new(:commentable => target, :user_id => user.id, :patron_id => patron_id, :patron_token => patron_token, :comment_text => msg_text, :commenter => commenter)

    comment.save
    comment
  end

  private
  def add_post
    Post.log(user, commentable, commentable.to_s, patron_id, patron_token, comment_text, true)
  end

end
