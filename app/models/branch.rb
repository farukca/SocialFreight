class Branch
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  include Gmaps4rails::ActsAsGmappable
  include Mongoid::Spacial::Document
 
  acts_as_gmappable

  field :name
  field :tel
  field :fax
  field :email
  field :postcode
  field :address
  field :district
  belongs_to :city
  belongs_to :state
  belongs_to :country
  field :location, type: Array, spacial: {lng: :longitude, lat: :latitude, return_array: true }
  field :gmaps, type: Boolean  
  field :status, default: "A"
  slug :name

  belongs_to :patron
  has_many :users
  has_many :positions
  has_many :loadings

  attr_accessible :name, :tel, :fax, :postcode, :district, :address, :city_id, :country_id, :status, :patron_id

  validates_presence_of :name#, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :patron#, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_length_of   :name, :maximum => 100#, :message => I18n.t('tasks.errors.name.too_long')

  before_save :get_coordinates
  
  def gmaps4rails_address
    "#{self.address}, #{self.district}, #{self.city.name}, #{self.country.name}" 
  end

  def get_coordinates
    self.location = Gmaps4rails.geocode(gmaps4rails_address).first unless self.address.nil?
  end

  def longitude
    self.location[0]
  end

  def latitude
    self.location[1]
  end

end
