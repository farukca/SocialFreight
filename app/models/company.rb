class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Token
  include Mongoid::Slug
  include Mongoid::Followee
  include Gmaps4rails::ActsAsGmappable
  include Mongoid::Spacial::Document
 
  acts_as_gmappable :process_geocoding => false, :validation => false

  field :name
  field :title
  belongs_to :patron
  field :patron_token
  belongs_to :branch
  field :company_type
  field :address
  field :district
  field :postcode
  belongs_to :city
  belongs_to :state
  belongs_to :country
  field :location, type: Array, spacial: {lng: :longitude, lat: :latitude, return_array: true }
  field :gmaps, type: Boolean
  field :tel
  field :gsm
  field :voip
  field :email
  field :website
  field :fax
  field :contact
  field :sector
  belongs_to :user
  belongs_to :saler, :class_name => User, :inverse_of => :saler
  field :twitter_url
  field :facebook_url
  field :linkedin_url
  field :notes
  field :description
  token :length => 25, :contains => :alphanumeric
  slug  :name, :scope => :patron, :permanent => true
  auto_increment :rec_number
  #acts_as_slugoid :generate_from => :name, :store_as => :slug

  has_many :transporter_positions, :class_name => "Position", :inverse_of => :transporter
  has_many :agent_positions, :class_name => "Position", :inverse_of => :agent
  has_many :forwarder_positions, :class_name => "Position", :inverse_of => :forwarder
  has_many :supplier_positions, :class_name => "Position", :inverse_of => :supplier
  has_many :loadings
  has_many :sender_loadings, :class_name => "Loading", :inverse_of => :sender
  has_many :loader_loadings, :class_name => "Loading", :inverse_of => :loader
  has_many :consignee_loadings, :class_name => "Loading", :inverse_of => :consignee
  has_many :agent_loadings, :class_name => "Loading", :inverse_of => :agent
  has_many :deliver_loadings, :class_name => "Loading", :inverse_of => :deliver
  has_many :notify_loadings, :class_name => "Loading", :inverse_of => :notify
  has_many :notify2_loadings, :class_name => "Loading", :inverse_of => :notify2
  has_many :customofficer_loadings, :class_name => "Loading", :inverse_of => :customofficer
  has_many :producer_loadings, :class_name => "Loading", :inverse_of => :producer
  has_many :presenter_loadings, :class_name => "Loading", :inverse_of => :presenter
  has_many :bank_loadings, :class_name => "Loading", :inverse_of => :bank
  has_many :comments, as: :commentable, dependent: :delete

  attr_accessible :name, :title, :company_type, :branch, :postcode, :address, :district, :city_id, :country_id, :state_id, 
                  :email, :website, :tel, :gsm, :voip, :fax, :contact, :sector, :twitter_url, :facebook_url, :linkedin_url, 
                  :notes, :description, :saler_id

  validates_presence_of :name, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :title, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :company_type, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :country, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :patron, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :patron_token, :on => :create, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_uniqueness_of :name, :case_sensitive => false
  validates_length_of :name, :maximum => 40
  validates_length_of :title, :maximum => 100

  before_save :get_coordinates
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

  def longitude
    self.location[0]
  end

  def latitude
    self.location[1]
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
    { :id => _id, :name => name }
  end

  def prepopulate_tokens
    [{ :id => _id, :name => name }]
  end

  def to_s
    name
  end

  private
  def set_after_jobs
    self.user.follow(self) if self.user
    self.user.create_activity(self, name, patron_id, patron_token)
    #patron.set_activity(self, 'create', user.id, 'created', user.full_name)
    Patron.journal_record(patron, user, branch, nil, self.class.name, 1, 0)
  end

end
