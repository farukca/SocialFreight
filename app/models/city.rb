class City
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name
  field :code

  validates_presence_of :name, :code
  validates_uniqueness_of :name, :case_sensitive => false
#  validates_uniqueness_of :code, :case_sensitive => false

  belongs_to :country

end
