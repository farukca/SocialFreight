class Branch < ActiveRecord::Base
 
  acts_as_gmappable :process_geocoding => false, :validation => false
  extend FriendlyId

  belongs_to :patron
  friendly_id :name, use: :slugged, use: :scoped, scope: :patron
  
  belongs_to :city
  belongs_to :state
  belongs_to :country

  has_many :users
  has_many :positions
  has_many :loadings
  has_many :journals, as: :journaled, dependent: :destroy

  attr_accessible :name, :tel, :fax, :postcode, :district, :address, :city_id, :country_id, :status, :patron_id

  validates :name, presence: { message: I18n.t('defaults.inputerror.cant_be_blank') }, length: { maximum: 100}

  default_scope { where(patron_id: Patron.current_id) }

  before_create :set_initials

  def gmaps4rails_address
    "#{self.address}, #{self.district}, #{self.city.name if self.city}, #{self.country.name if self.country}" 
  end
  
  def prevent_geocoding
    self.address.blank? #|| (!self.location.blank?)
  end
  
  private
  def set_initials
    self.patron_token = self.patron.token if self.patron_token.blank?
  end

end
