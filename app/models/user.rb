class User < ActiveRecord::Base
  authenticates_with_sorcery!

  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_mentionable
  
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  mount_uploader :avatar, AvatarUploader

  has_one  :person
  has_many :positions
  has_many :loadings
  has_many :activities
  has_many :comments
  has_many :posts
  has_many :contacts
  has_many :journals, as: :journaled, dependent: :destroy

  attr_accessible :email, :password, :password_confirmation, :name, :surname, :patron_id, :avatar, :remove_avatar, 
                   :region, :time_zone, :user_type, :language, :locale, :mail_encoding, :role
  #attr_protected  :password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :surname
  validates_uniqueness_of :email, :case_sensitive => false

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

  def full_name
    self.name + " " + self.surname
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

  private
  def create_person
    person = self.build_person()
    person.name = self.name
    person.surname = self.surname
    person.email = self.email
    person.patron_id = self.patron_id
    person.patron_token = self.patron_key
    person.save!
  end
end
