class City
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  field :name
  field :city_code
  slug :name
  belongs_to :state
  belongs_to :country

  attr_accessible :name, :city_code, :country_id

  validates_presence_of :name, :country_id

end
