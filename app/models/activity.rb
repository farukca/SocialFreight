class Activity
  include Mongoid::Document
  include Mongoid::Timestamps

  field :action
  field :action_text
  field :user_name
  field :patron_token
  belongs_to :user
  belongs_to :patron
  belongs_to :target, :polymorphic => true
  belongs_to :comment_target, :polymorphic => true

   attr_accessible :action, :action_text, :target, :patron_id, :patron_token, :comment_target_type, :comment_target_id, :user_id, :user_name

  validates_presence_of :action, :action_text, :user_id, :patron_id, :target, :patron_token

  scope :latests, order_by(:created_at, :desc)

  def self.log(patron, target, action, creator_id, action_text, user_name, token)
    patron_id = patron.try(:id)
    #return if patron.try(:is_importing)
    
    #is_private = target.respond_to?(:is_private) && target.is_private

    if target.is_a? Comment
      comment_target_type = target.commentable_type
      comment_target_id = target.commentable_id
      #is_private = target.respond_to?(:is_private) && target.is_private
    end
    
    activity = Activity.new(
      :target => target,
      :action => action,
      :action_text => action_text,
      :user_id => creator_id,
      :patron_id => patron_id,
      :patron_token => token,
      :comment_target_type => comment_target_type,
      :comment_target_id => comment_target_id,
      #:is_private => is_private)
      :user_name => user_name)

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
end
