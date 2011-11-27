class Place
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  include Gmaps4rails::ActsAsGmappable
  include Mongoid::Spacial::Document
 
  acts_as_gmappable

  field :name
  field :code
  field :place_type
  field :postcode
  field :district
  field :address
  belongs_to :city
  belongs_to :state
  belongs_to :country
  field :location, type: Array, spacial: {lng: :longitude, lat: :latitude, return_array: true }
  field :gmaps, type: Boolean
  field :description
  #geocode
  slug :name, :scope => :country, :permanent => true
  auto_increment :rec_number

  attr_accessible :name, :code, :place_type, :postcode, :district, :city_id, :state_id, :country_id, :description, :address

  validates_presence_of :name, :place_type, :country

  before_save :get_coordinates
  
  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.address}, #{self.district}, #{self.city.name}, #{self.country.name}" 
  end

  def get_coordinates
    self.location = Gmaps4rails.geocode(gmaps4rails_address).first
  end

  def longitude
    self.location[0]
  end

  def latitude
    self.location[1]
  end

  class << self
    def place_types()
      place_types = {
        'AP' => 'Air Port',
        'SP' => 'Sea Port',
        'WH' => 'Warehouse',
        'CW' => 'Custom Warehouse',
        'RS' => 'Rail Station',
        'CS' => 'Customs',
        'OT' => 'Other'
      }
    end
  end

  def token_inputs
    { :id => _id, :name => name }
  end

  def prepopulate_tokens
    [{ :id => _id, :name => name }]
  end

end
