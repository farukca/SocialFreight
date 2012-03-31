class Company < ActiveRecord::Base

  include Gmaps4rails::ActsAsGmappable
  extend FriendlyId
   
  acts_as_gmappable :process_geocoding => false, :validation => false
  acts_as_followable
  acts_as_likeable
  
  belongs_to :patron
  belongs_to :branch
  belongs_to :city
  belongs_to :state
  belongs_to :country
  belongs_to :user
  belongs_to :saler, :class_name => User, :inverse_of => :saler

  friendly_id :name, use: :slugged#, :scope => :patron
  
  has_many :contacts
  accepts_nested_attributes_for :contacts, :reject_if => lambda { |a| a[:surname].blank? }, :allow_destroy => true
  #has_many :arrivals
  #has_many :departures
  has_many :comments, as: :commentable, dependent: :destroy

  attr_accessible :name, :title, :company_type, :branch_id, :postcode, :address, :district, :city_id, :country_id, :state_id, 
                  :email, :website, :tel, :gsm, :voip, :fax, :contact, :sector, :twitter_url, :facebook_url, :linkedin_url, 
                  :notes, :description, :saler_id, :contacts_attributes

  validates_presence_of :name, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :title, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :company_type, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :country, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :patron, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :patron_token, :on => :create, :message => I18n.t('patrons.errors.title.cant_be_blank')
  #validates_uniqueness_of :name, :case_sensitive => false
  validates_length_of :name, :maximum => 40
  validates_length_of :title, :maximum => 100

  before_save   :get_coordinates
  before_create :set_initials
  after_create  :set_after_jobs

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.address}, #{self.district}, #{self.city.name}, #{self.country.name}" 
  end

  def get_coordinates
    if self.address.present? && self.location.blank?
      self.location = Gmaps4rails.geocode(gmaps4rails_address).first
    end
  end

  def prevent_geocoding
    self.address.blank? #|| (!self.location.blank?)
  end

  class << self

    def company_types()
      company_types = {
        'CU' => 'Customer',
        'SU' => 'Supplier',
        'FA' => 'Foreign Agent',
        'BN' => 'Bank',
        'TO' => 'Tax Office',
        'XF' => 'Other'
      }
    end
  end

  def token_inputs
    { :id => id, :text => name }
  end

  def prepopulate_tokens
    [{ :id => id, :name => name }]
  end

  def to_s
    name
  end

  private
  def set_initials
    counter = self.patron.generate_counter("Company", nil, nil)
    self.company_no = counter
  end
  
  private
  def set_after_jobs
    self.user.follow!(self) if self.user
    self.user.create_activity(self, name, patron_id, patron_token)
    #patron.set_activity(self, 'create', user.id, 'created', user.full_name)
    Patron.journal_record(patron, user, branch, nil, self.class.name, 1, 0)
  end

end
