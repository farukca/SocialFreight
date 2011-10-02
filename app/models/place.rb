class Place
  include Mongoid::Document
  field :name
  field :code
  field :place_type
  field :postcode
  field :district
  belongs_to :city
  belongs_to :country
  field :description

  validates_presence_of :name, :code, :place_type, :country_id, :city_id

end
