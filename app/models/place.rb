class Place
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :name
  field :code
  field :place_type
  field :postcode
  field :district
  belongs_to :city
  belongs_to :state
  belongs_to :country
  field :description
  #geocode
  slug :name, :scope => :country, :permanent => true
  auto_increment :rec_number

  attr_accessible :name, :code, :place_type, :postcode, :district, :city_id, :state_id, :country_id, :description

  validates_presence_of :name, :place_type, :country

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
