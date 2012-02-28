class Person < ActiveRecord::Base
  #include Mongoid::Document
  #include Mongoid::Timestamps
  #include Mongoid::Token
  #include Mongoid::Slug
  extend FriendlyId
  friendly_id :name, :surname, use: :slugged
  
  #field :name
  #field :surname
  belongs_to :patron
  belongs_to :branch
  #field :patron_token
  #field :task
  #field :departman
  #field :gsm
  #field :tel
  #field :voip
  #field :email
  #field :website
  #field :twitter_url
  #field :linkedin_url
  #field :facebook_url
  #field :address
  #field :district
  #field :postcode
  belongs_to :city
  belongs_to :state
  belongs_to :country
  #field :avatar
  #field :public, type: Boolean
  #field :status, default: 'A'
  #field :start_date, type: Date
  #field :start_type
  #field :citizen_no
  #field :nation
  #token :length => 25, :contains => :alphanumeric
  #slug  :name, :surname, :scope => :patron, :permanent => true
  #auto_increment :rec_number

  mount_uploader :avatar, AvatarUploader

  attr_accessor :password

  attr_accessible :name, :surname, :postcode, :address, :district, :city_id, :country_id, :state_id, 
                  :email, :website, :tel, :gsm, :voip, :twitter_url, :facebook_url, :linkedin_url, 
                  :avatar, :password, :password_confirmation

  #attr_readonly :patron, :patron_key, :email
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :name, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :surname, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :email, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :patron, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :patron_token, :on => :create, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_length_of :name, :maximum => 40
  validates_length_of :surname, :maximum => 100
  validates_uniqueness_of :email, :case_sensitive => false

end
