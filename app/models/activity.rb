class Activity
  include Mongoid::Document
  include Mongoid::Timestamps

  field :patron_token
  belongs_to :user
  belongs_to :patron
  belongs_to :target, :polymorphic => true
  field :target_name 

  attr_accessible :target_name, :target, :patron_id, :patron_token, :user_id

  validates_presence_of :user_id, :patron_id, :target_name, :target, :patron_token

  scope :latests, order_by(:created_at, :desc)

  after_create :create_comment

  def self.log(user, target, target_name, patron_id, patron_token)
    patron_id ||= user.patron_id
    patron_token ||= user.patron.token

    activity = Activity.new(:target => target, :user_id => user.id, :patron_id => patron_id, :patron_token => patron_token, :target_name => target_name)

    #activity.created_at = case action
    #  when 'create'
    #    target.try(:created_at)
    #  when 'edit'
    #    target.try(:updated_at)
    #  when 'delete'
    #    target.try(:deleted_at) || target.try(:updated_at)
    #  end || target.try(:created_at) || Time.now

    activity.save
    
    activity
  end

  def real_target_type
    if self.target.is_a? Comment
      self.comment_target_type
    else
      self.target_type
    end
  end

  private
  def create_comment
    Comment.log(user, target, target_name, patron_id, patron_token, 'S')
  end
end
