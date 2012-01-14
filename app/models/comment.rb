class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :comment_text
  field :user_name
  field :patron_token
  belongs_to :user
  belongs_to :patron
  belongs_to :commentable, polymorphic: true

  attr_accessible :comment_text

  validates_presence_of :comment_text, :user_id, :patron_token, :patron_id

  after_create :log_activity

  def log_activity
    self.patron.set_activity(self, 'create', self.user_id, 'commented', self.user_name)
  end

end
