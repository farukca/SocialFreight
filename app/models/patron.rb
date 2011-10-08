class Patron
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Token
  include Mongoid::Slug

  #STATUS_NAMES = [:active, :inactive, :cancelled, :potential]
  #STATUSES = STATUS_NAMES.each_with_index.each_with_object({}) {|(name, code), all| all[name] = code }

  field :name
  field :title
  field :email
  field :website
  field :tel
  field :fax
  field :postcode
  field :address
  belongs_to :city
  belongs_to :state
  belongs_to :country
  field :status, default: "A"
  token :length => 7, :contains => :alphanumeric

  belongs_to :saler, :class_name => User, :inverse_of => :saler, :foreign_key => "saler_id" 

  slug :title, :as => :code

  has_many :branches
  has_many :users

  attr_accessible :title, :email, :website, :tel, :fax, :postcode, :address, :city_id, :country_id, :status, :saler_id

  before_create :generate_patron
  after_create  :create_patron_user

  validates_presence_of :title, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :email, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :tel,   :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_uniqueness_of :email, :case_sensitive => false, :on => :create

  validates_length_of   :title, :maximum => 255#, :message => I18n.t('tasks.errors.name.too_long')
  validates_length_of   :tel, :maximum => 12#, :message => I18n.t('tasks.errors.name.too_long')


  protected
  def generate_patron
    self.name = self.title
  end

  def create_patron_user
    self.users.create(:name => "SocialFreight", :surname => "Admin", :email => self.email, :password => self.token, :password_confirmation => self.token);
  end

end
