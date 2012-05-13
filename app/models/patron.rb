class Patron < ActiveRecord::Base

  #STATUS_NAMES = [:active, :inactive, :cancelled, :potential]
  #STATUSES = STATUS_NAMES.each_with_index.each_with_object({}) {|(name, code), all| all[name] = code }
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  serialize  :operations
  belongs_to :city
  belongs_to :state
  belongs_to :country
 
  mount_uploader :logo, LogoUploader

  has_many :counters
  accepts_nested_attributes_for :counters, :allow_destroy => true
  
  has_many :branches
  accepts_nested_attributes_for :branches, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
  has_many :users
  accepts_nested_attributes_for :users, :reject_if => lambda { |a| a[:email].blank? }, :allow_destroy => true  
  
  has_many :people
  has_many :companies
  has_many :positions
  has_many :loadings
  has_many :activities
  has_many :journals, as: :journaled, dependent: :destroy
  #has_and_belongs_to_many :operations
  
  attr_accessible :title, :website, :tel, :fax, :postcode, :district, :address, :city_id, :country_id, :status, :saler_id, 
                  :email, :operations, :contact_name, :contact_surname, :time_zone, :language, :logo, :remove_logo,
                  :vehicle_owner, :depot_owner, :patron_type, :iata_code, :fmc_code,
                  :counters_attributes, :users_attributes, :branches_attributes

  before_create :set_initials
  after_create  :create_head_office, :create_patron_user #, :create_company

  validates_presence_of :title#, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :email#, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :contact_name#, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :contact_surname#, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :tel#,   :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_uniqueness_of :email, :case_sensitive => false

  validates_length_of   :title, :maximum => 255#, :message => I18n.t('tasks.errors.name.too_long')
  validates_length_of   :tel, :maximum => 12#, :message => I18n.t('tasks.errors.name.too_long')

  def generate_counter(ctype, operation, direction)
    counter = self.counters.find_or_initialize_by_operation_and_counter_type(operation, ctype)
    counter.increment(:count, 1)
    counter.save!
    return counter.get_reference
  end

  def set_activity(target, action, creator_id=nil, action_text, user_name)
    creator_id ||= target.user_id
    #return log_later(target, action, creator_id) if self.is_importing
    Activity.log(self, target, action, creator_id, action_text, user_name, self.token)
  end

  def self.journal_record(patron, user, branch, team, journal_model, unit, amount)
    Journal.log(patron, journal_model, patron.id, patron.token, unit, amount)

    Journal.log(user, journal_model, patron.id, patron.token, unit, amount) if user
    Journal.log(branch, journal_model, patron.id, patron.token, unit, amount) if branch
    Journal.log(team, journal_model, patron.id, patron.token, unit, amount) if team

  end

  class << self
    def statuses()
      statuses = {
        'A' => 'Active',
        'C' => 'Closed',
        'I' => 'Cancelled'
      }
    end

    def employee_ranks()
      employee_ranks = {
        '0..3'   => '0-3Employees',
        '4..12'  => '4-12Employees',
        '13..60' => '13-60Employees',
        '61..99' => '61-99Employees',
        '100..+' => '100+Employees'
      }
    end

  end

  private
  def set_initials
    self.name = self.title
    self.token = SecureRandom.urlsafe_base64[0,20]
  end

  private
  def create_patron_user
    user = self.users.build()
    user.name = self.contact_name
    user.surname = self.contact_surname
    user.email = self.email
    user.patron_id = self.id
    user.patron_key = self.token
    user.branch_id  = self.branches.first.id
    user.password = '9876543210'
    user.password_confirmation = '9876543210'
    user.save!
    user.add_role :patron_admin
  end

  def create_head_office
    branch = self.branches.build()  
    branch.name = 'Head Office'
    branch.patron_token = self.token
    branch.save!
  end

  def create_counters
    
  end

end
