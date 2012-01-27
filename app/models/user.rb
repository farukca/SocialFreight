class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  include Mongoid::Follower

  authenticates_with_sorcery!

  field :name
  field :surname
  field :email
  field :crypted_password
  field :salt
  belongs_to :patron
  belongs_to :branch
  field :region
  field :time_zone
  field :user_type
  field :locale
  field :language
  field :mail_encoding
  field :last_login_at, type: DateTime
  field :last_logout_at, type: DateTime
  field :last_activity_at, type: DateTime
  field :activation_state
  field :activation_token
  field :activation_token_expires_at, type: DateTime
  field :password_reset_token
  field :password_reset_email_time, type: DateTime
  field :password_reset_token_expires_at, type: DateTime
  field :failed_logins_count, type: Integer
  field :lock_expires_at, type: DateTime
  slug  :name, :surname, :as => :title, :scope => :patron, :permanent => true
  auto_increment :rec_number
  field :role
  field :avatar

  mount_uploader :avatar, AvatarUploader

  has_many :positions
  has_many :loadings
  has_many :activities
  has_many :comments
  has_many :posts
  #has_many :companies
  has_many :journals, as: :journaled, dependent: :delete

  attr_accessible :email, :password, :password_confirmation, :name, :surname, :patron_id, :avatar, :remove_avatar
  #attr_protected  :password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :surname
  validates_uniqueness_of :email, :case_sensitive => false

  #after_create  :send_activation_mail

  #def send_activation_mail
  #  UserMailer.activation_needed_email(self).deliver
  #end

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

  def full_name
    self.name + " " + self.surname
  end

  def create_activity(target, target_name, patron_id, patron_token)
    #creator_id ||= target.user_id
    target_name ||= target.to_s
    Activity.log(self, target, target_name, patron_id, patron_token)
  end

end
