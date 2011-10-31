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
  field :patron_type
  field :status, default: "A"
  belongs_to :saler, :class_name => User, :inverse_of => :saler, :foreign_key => "saler_id" 
  token :length => 7, :contains => :alphanumeric
  slug :title, :as => :code

  embeds_many :counters
  has_many :branches
  has_many :users
  has_many :companies
  has_many :positions
  has_many :loadings

  attr_accessor :password
  attr_accessible :title, :website, :tel, :fax, :postcode, :address, :city_id, :country_id, :status, :saler_id, 
                  :email, :password, :password_confirmation

  before_create :generate_patron
  after_create  :create_patron_user

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :title, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :email, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :tel,   :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_uniqueness_of :email, :case_sensitive => false

  validates_length_of   :title, :maximum => 255#, :message => I18n.t('tasks.errors.name.too_long')
  validates_length_of   :tel, :maximum => 12#, :message => I18n.t('tasks.errors.name.too_long')

  private
  def generate_patron
    self.name = self.title
  end

  private
  def create_patron_user
    self.users.create(:name => "SocialFreight", :surname => "Admin", :email => self.email, :password => self.password, :password_confirmation => self.password_confirmation);
  end

  def generate_counter(ctype, operation, direction)
    counter = self.counters.find_or_initialize_by(counter_type: ctype, operation: operation, direction: direction)
    counter.inc(:count, 1)
    counter.save!
    return counter.count
  end

  class << self
    def statuses()
      statuses = {
        'A' => 'Active',
        'C' => 'Closed',
        'I' => 'Cancelled'
      }
    end

    def ranks()
      ranks = {
        '10' => 'Reservation',
        '20' => 'Loading',
        '30' => 'On Way',
        '40' => 'Unloading'
      }
    end

   def operations()
     operations = {
        'A' => 'Air',
        'S' => 'Sea',
        'R' => 'Rail',
        'T' => 'Truck',
        'I' => 'Inland'
     }
   end

  end


end
