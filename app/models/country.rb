class Country
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :code
  field :name
  field :telcode
  slug  :name

  has_many :cities
  has_many :states
  
  attr_accessible :name, :code, :telcode
  
  validates_presence_of :name, :code
  validates_uniqueness_of :name, :case_sensitive => false
  validates_uniqueness_of :code, :case_sensitive => false
  validates_length_of   :code, :maximum => 2
  validates_length_of   :name, :maximum => 100
  
  def token_inputs
     { :id => _id, :name => name }
  end


end
