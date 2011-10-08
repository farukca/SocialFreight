class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  authenticates_with_sorcery!

  field :name
  field :surname
  field :email
  field :crypted_password
  field :salt
  field :slug
  field :password_reset_token
  field :password_reset_time, type: DateTime
  slug :name, :surname

  belongs_to :patron
  belongs_to :branch

  attr_accessible :email, :password, :password_confirmation, :name, :surname, :patron_id

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  #validates_uniqueness_of :email, :case_sensitive => false, :on => :create

  after_create  :send_activation_mail

  def send_activation_mail
    UserMailer.user_activation(self).deliver
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_time = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(conditions: {column: self[column]})
  end
end
