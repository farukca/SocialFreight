class Person < ActiveRecord::Base

  extend FriendlyId
  friendly_id :to_s, use: :slugged

  belongs_to :user
  belongs_to :branch
  belongs_to :city
  belongs_to :state
  belongs_to :country
  belongs_to :manager, :class_name => "Person", :foreign_key => "manager_id"

  mount_uploader :avatar, AvatarUploader

  attr_accessible :name, :surname, :postcode, :address, :district, :city_id, :country_id, :state_id, 
                  :email, :website, :busitel, :gsm, :voip, :twitter, :facebook, :linkedin, :avatar, :patron_id, :patron_token

  validates_presence_of :name, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :surname, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_length_of   :name, :maximum => 40
  validates_length_of   :surname, :maximum => 100

  def to_s
    "#{self.name} #{self.surname}" 
  end
end
