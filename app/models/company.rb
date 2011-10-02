class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name
  field :title
  belongs_to :patron
  field :patron_key
  belongs_to :branch

  field :address
  field :postcode
  belongs_to :city
  belongs_to :country
  field :tel
  field :email
  field :fax
  field :invoice_address

  belongs_to :user
  belongs_to :saler, :class_name => User, :inverse_of => :saler, :foreign_key => "saler_id" 

  #has_many :branches
  #has_many :stuffs

  validates_presence_of :name, :title
  #validates_uniqueness_of :name, :case_sensitive => false
  #validates_presence_of :country_id, :city_id, :address

end
