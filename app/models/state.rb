class State < ActiveRecord::Base
  #include Mongoid::Document
  #include Mongoid::Timestamps
  #include Mongoid::Slug
  include Gmaps4rails::ActsAsGmappable
  #include Mongoid::Spacial::Document
 
  acts_as_gmappable

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  #field :name
  #field :code
  #field :telcode
  belongs_to :country
  #field :location, type: Array, spacial: {lng: :longitude, lat: :latitude, return_array: true }
  #field :gmaps, type: Boolean
  #slug :name, :scope => :country, :permanent => true

  has_many :cities

  attr_accessible :name, :code, :country_id

  validates_presence_of :name, :country_id

  before_save :get_coordinates
  
  def gmaps4rails_address
    "#{self.name}, #{self.country.name}" 
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

end
