class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :patron_token
  belongs_to :user
  belongs_to :patron
  belongs_to :target, :polymorphic => true
  field :target_name
  field :message
  field :post_type, default: "10"
  field :is_private, type: Boolean, default: false
  field :is_syspost, type: Boolean, default: false
  
  has_many :comments, as: :commentable, dependent: :delete

  attr_accessible :message, :post_type, :target_name, :target, :patron_id, :patron_token, :user_id, :is_private, :is_syspost

  validates_presence_of :user_id, :patron_id, :patron_token, :message

  scope :latests, order_by(:created_at, :desc)

  def self.log(user, target, target_name, patron_id, patron_token, action_text, syspost_flag)
    patron_id ||= user.patron_id
    patron_token ||= user.patron.token
    private_post = true

    post = Post.new(:target => target, :user_id => user.id, :patron_id => patron_id, :patron_token => patron_token, :target_name => target_name, :message => action_text, :is_private => private_post, :is_syspost => syspost_flag)

    post.save
    
    post
  end

end
