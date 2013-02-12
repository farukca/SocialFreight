class User < ActiveRecord::Base
  authenticates_with_sorcery!
  rolify

  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_mentionable
  extend FriendlyId
  include GeneratesNick

  belongs_to :patron
  friendly_id :to_s, use: :slugged, use: :scoped, scope: :patron

  mount_uploader :avatar, AvatarUploader

  has_one  :person
  has_many :positions
  has_many :loadings
  has_many :activities
  has_many :comments
  has_many :posts
  has_many :contacts
  has_many :tasks
  has_many :journals, as: :journaled, dependent: :destroy
  has_many :documents
  has_many :junks

  attr_accessible :email, :password, :password_confirmation, :name, :surname, :patron_id, :avatar, :remove_avatar, 
                   :region, :time_zone, :user_type, :language, :locale, :mail_encoding, :role, :branch_id
  #attr_protected  :password

  validates :password, presence: true, confirmation: true, length: { minimum: 8, maximum: 20 }
  #validates_confirmation_of :password
  #validates_presence_of :password, on: :create
  #validates_length_of :password, minimum: 8 
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { in: 7..60 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates :name, presence: true, on: :update
  validates :surname, presence: true, on: :update
  #validates_uniqueness_of :email, :case_sensitive => false
  validates :branch_id, presence: true
  #validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)

  after_create  :send_activation_mail

  def send_activation_mail
    #UserMailer.activation_needed_email(self).deliver
    Resque.enqueue(UserActivationMailer, self.id)
    #QC.enqueue "UserMailer.activation_needed_email.deliver", self.id
  end

  #def send_password_reset_email
  #  generate_token(:password_reset_token)
  #  self.password_reset_email_time = Time.zone.now
  #  save!
  #  UserMailer.password_reset_email(self).deliver
  #end

  def token_inputs
    { id: id, text: to_s }
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.where(column: self[column]).exists?#(conditions: {column: self[column]})
  end

  def to_s
    "#{name} #{surname}"
  end

  def social_name
    self.slug
  end

  def generate_temp_password
    self.password = "9516284"
    self.password_confirmation = "9516284"
  end

  #def create_activity(target, target_name, patron_id, patron_token)
  #  #creator_id ||= target.user_id
  #  target_name ||= target.to_s
  #  Activity.log(self, target, target_name, patron_id, patron_token)
  #end

  def social_posts
    #@social_posts = Post.where("user_id IN (?) OR user_id = ? ", self.followees(User), self.id).limit(6).order("created_at desc")
    @social_posts = Post.includes(:user).includes(:comments).limit(6).order("updated_at desc")
  end

  def active_tasks
    @tasks = Task.includes(:user).active.where(user_id: self.id)
  end

end