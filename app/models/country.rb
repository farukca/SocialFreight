class Country < ActiveRecord::Base

  include Gmaps4rails::ActsAsGmappable
 
  acts_as_gmappable
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :cities
  has_many :states
  
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
