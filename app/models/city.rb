class City
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  include Gmaps4rails::ActsAsGmappable
  include Mongoid::Spacial::Document
 
  acts_as_gmappable

  field :name
  field :code
  field :telcode
  belongs_to :state
  belongs_to :country
  field :location, type: Array, spacial: {lng: :longitude, lat: :latitude, return_array: true }
  field :gmaps, type: Boolean
  slug :name, :permanent => true

  attr_accessible :name, :code, :telcode, :country_id, :state_id

  validates_presence_of :name, :country_id

  before_save :get_coordinates
  
  def gmaps4rails_address
    if self.state.nil?
      "#{self.name}, #{self.country.name}" 
    else
      "#{self.name}, #{self.state.name}, #{self.country.name}" 
    end
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

  def token_inputs
    { :id => _id, :name => name }
  end

  def prepopulate_tokens
    [{ :id => _id, :name => name }]
  end

end
