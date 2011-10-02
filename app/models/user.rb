class User
  include Mongoid::Document
  include Mongoid::Timestamps

  authenticates_with_sorcery!

  field :username
  field :email
  field :crypted_password
  field :salt
  field :slug

  belongs_to :patron
  field :patron_key
  belongs_to :branch

  attr_accessible :email, :password, :password_confirmation, :username, :patron_id

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email, :case_sensitive => false

  before_create :get_def_values

  protected
  def get_def_values
    self.slug = username  #.to_permalink
    patron = Patron.find(self.patron_id)
    self.patron_key = patron.patron_key
  end

end
