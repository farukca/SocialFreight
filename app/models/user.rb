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

  attr_accessible :email, :password, :password_confirmation, :name, :surname, :patron_id, :avatar, :remove_avatar, 
                   :region, :time_zone, :user_type, :language, :locale, :mail_encoding, :role, :branch_id
  #attr_protected  :password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :surname
  validates_uniqueness_of :email, :case_sensitive => false
  validates_presence_of :branch_id

  before_create :set_initials
  after_create  :create_person, :send_activation_mail

  def send_activation_mail
    UserMailer.activation_needed_email(self).deliver
  end

  def roles_list
    [:admin, :operator, :financer, :ledger, :saler, :planner, :manager]
  end

  def has_role? role
    roles_list.include? role.to_sym
  end

  def send_password_reset_email
    generate_token(:password_reset_token)
    self.password_reset_email_time = Time.zone.now
    save!
    UserMailer.password_reset_email(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(conditions: {column: self[column]})
  end

  def to_s
    self.name + " " + self.surname
  end

  def social_name
    self.slug
  end

  def generate_temp_password
    self.password = "9516284"
    self.password_confirmation = "9516284"
  end

  def create_activity(target, target_name, patron_id, patron_token)
    #creator_id ||= target.user_id
    target_name ||= target.to_s
    Activity.log(self, target, target_name, patron_id, patron_token)
  end

  def social_posts
    @social_posts = Post.where("user_id IN (?) OR user_id = ? ", self.followees(User), self.id).limit(10).order("created_at desc")
  end

  private
  def set_initials
    if self.patron_key.blank? && self.patron
      self.patron_key = self.patron.token
    end
  end

  private
  def create_person
    if self.patron.present?
      person = self.build_person()
      person.name = self.name
      person.surname = self.surname
      person.email = self.email
      person.patron_id = self.patron_id
      person.patron_token = self.patron_key
      person.save!
    end
  end
end