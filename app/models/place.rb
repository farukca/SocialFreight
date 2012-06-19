class Place  < ActiveRecord::Base
 
  acts_as_gmappable #:process_geocoding => false, :validation => false

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :city
  belongs_to :state
  belongs_to :country

  attr_accessible :name, :code, :place_type, :postcode, :district, :city_id, :state_id, :country_id, :description, :address

  validates_presence_of :name, :place_type, :country, :city_id
  
  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.address}, #{self.district}, #{self.city.name}, #{self.country.name}" 
  end

  class << self
    def place_types()
      place_types = {
        'air' => 'Air Port',
        'sea' => 'Sea Port',
        'rail' => 'Rail Station',
        'road' => 'Customs'
      }
    end
  end

  def token_inputs
    { :id => id, :text => name }
  end

  def prepopulate_tokens
    [{ :id => id, :name => name }]
  end

end
