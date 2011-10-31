class State
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :name
  field :code
  field :telcode
  belongs_to :country
  slug :name, :scope => :country, :permanent => true

  has_many :cities

  attr_accessible :name, :code, :country_id

  validates_presence_of :name, :country_id

end
