class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name
  field :title
  belongs_to :patron
  field :patron_token
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

  has_many :transporter_positions, :class_name => "Position", :inverse_of => :transporter
  has_many :agent_positions, :class_name => "Position", :inverse_of => :agent
  has_many :forwarder_positions, :class_name => "Position", :inverse_of => :forwarder

  validates_presence_of :name, :title

end
