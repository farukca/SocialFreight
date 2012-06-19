class City < ActiveRecord::Base
  include Gmaps4rails::ActsAsGmappable
 
  acts_as_gmappable :process_geocoding => false, :validation => false
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :state
  belongs_to :country
  
  has_many :arrivals
  has_many :departures

  attr_accessible :name, :code, :telcode, :country_id, :state_id

  validates_presence_of :name, :country_id
  
  def gmaps4rails_address
    if self.state.nil?
      "#{self.name}, #{self.country.name}" 
    else
      "#{self.name}, #{self.state.name}, #{self.country.name}" 
    end
  end

  def token_inputs
    { :id => _id, :name => name }
  end

  def prepopulate_tokens
    [{ :id => _id, :name => name }]
  end

end
