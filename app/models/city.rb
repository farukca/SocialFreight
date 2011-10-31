class City
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :name
  field :code
  field :telcode
  belongs_to :state
  belongs_to :country
  slug :name, :permanent => true

  attr_accessible :name, :code, :telcode, :country_id, :state_id

  validates_presence_of :name, :country_id

  def token_inputs
    { :id => _id, :name => name }
  end

  def prepopulate_tokens
    [{ :id => _id, :name => name }]
  end

end
