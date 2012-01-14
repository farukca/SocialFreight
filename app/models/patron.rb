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
  field :gsm
  field :postcode
  field :address
  field :contact_name
  field :contact_surname
  belongs_to :city
  belongs_to :state
  belongs_to :country
  field :patron_type
  field :status, default: "A"
  field :logo
  field :operations, type: Array
  belongs_to :saler, :class_name => User, :inverse_of => :saler, :foreign_key => "saler_id" 
  token :length => 7, :contains => :alphanumeric
  slug :title, :as => :code

  embeds_many :counters
  has_many :branches
  has_many :users
  has_many :people
  has_many :companies
  has_many :positions
  has_many :loadings
  has_many :activities

  mount_uploader :logo, LogoUploader

  attr_accessible :title, :website, :tel, :fax, :postcode, :address, :city_id, :country_id, :status, :saler_id, 
                  :email, :operations, :contact_name, :contact_surname, :logo, :remove_logo

  before_create :generate_patron
  after_create  :create_patron_user

  validates_presence_of :title#, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :email#, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :contact_name#, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :contact_surname#, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :tel#,   :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_uniqueness_of :email, :case_sensitive => false

  validates_length_of   :title, :maximum => 255#, :message => I18n.t('tasks.errors.name.too_long')
  validates_length_of   :tel, :maximum => 12#, :message => I18n.t('tasks.errors.name.too_long')

  private
  def generate_patron
    self.name = self.title
  end

  private
  def create_patron_user
    #self.users.create(:name => self.contact_name, :surname => self.contact_surname, :email => self.email, :password => '9876543210', :password_confirmation => '9876543210');
    @user = self.users.build()
    @user.name = self.contact_name
    @user.surname = self.contact_surname
    @user.email = self.email
    @user.password = '9876543210'
    @user.password_confirmation = '9876543210'
    @user.save!
  end

  def generate_counter(ctype, operation, direction)
    counter = self.counters.find_or_initialize_by(counter_type: ctype, operation: operation, direction: direction)
    counter.inc(:count, 1)
    counter.save!
    return counter.count
  end

  def set_activity(target, action, creator_id=nil, action_text, user_name)
    creator_id ||= target.user_id
    #return log_later(target, action, creator_id) if self.is_importing
    Activity.log(self, target, action, creator_id, action_text, user_name, self.token)
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

  end


end
