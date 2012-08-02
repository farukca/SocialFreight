class Country < ActiveRecord::Base

  self.primary_key = 'code'
  include Gmaps4rails::ActsAsGmappable
 
  acts_as_gmappable :process_geocoding => false, :validation => false
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :cities, :foreign_key => "country_id"
  has_many :states, :foreign_key => "country_id"
  
  attr_accessible :name, :code, :telcode
  
  validates_presence_of :name, :code
  validates_uniqueness_of :name, :case_sensitive => false
  validates_uniqueness_of :code, :case_sensitive => false
  validates_length_of   :code, :maximum => 2
  validates_length_of   :name, :maximum => 100

  #before_save :get_coordinates

  def gmaps4rails_address
    self.name
  end

  #def get_coordinates
  #  self.location = Gmaps4rails.geocode(gmaps4rails_address).first
  #end

  def token_inputs
     { :id => _id, :name => name }
  end


end
