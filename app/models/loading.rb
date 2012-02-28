class Loading < ActiveRecord::Base
  #include Mongoid::Document
  #include Mongoid::Timestamps
  #include Mongoid::Slug
  #include Mongoid::Followee
  include Gmaps4rails::ActsAsGmappable
  #include Mongoid::Spacial::Document
 
  acts_as_gmappable :process_geocoding => false, :validation => false
  extend FriendlyId
  friendly_id :reference, use: :slugged
  
  #field :reference
  #field :hwb_no
  belongs_to :position
  #field :operation
  #field :direction
  #field :incoterm
  #field :paid_at
  #field :channel
  belongs_to :patron
  #field :patron_token
  belongs_to :branch
  belongs_to :company
  #belongs_to :loader, :class_name => "Company", :inverse_of => :loader
  #belongs_to :sender, :class_name => "Company", :inverse_of => :sender
  #belongs_to :consignee, :class_name => "Company", :inverse_of => :consignee
  #belongs_to :notify, :class_name => "Company", :inverse_of => :notify
  #belongs_to :notify2, :class_name => "Company", :inverse_of => :notify2
  #belongs_to :deliver, :class_name => "Company", :inverse_of => :deliver
  belongs_to :agent, :class_name => "Company", :inverse_of => :agent

  #Loading address and place infos
  #field :load_place_type
  #belongs_to :load_place, :class_name => "Place", :inverse_of => :load_place
  #belongs_to :departure_country, :class_name => "Country", :inverse_of => :departure_loads
  #belongs_to :departure_city, :class_name => "City", :inverse_of => :departure_loads
  #field :departure_district
  #field :departure_postcode
  #field :departure_address
  #field :departure_location, type: Array, spacial: {lng: :longitude, lat: :latitude, return_array: true }
  #field :load_point

  #Unloading address and place infos
  #field :unload_place_type
  #belongs_to :unload_place, :class_name => "Place", :inverse_of => :unload_place
  #belongs_to :arrival_country, :class_name => "Country", :inverse_of => :arrival_loads
  #belongs_to :arrival_city, :class_name => "City", :inverse_of => :arrival_loads
  #field :arrival_district
  #field :arrival_postcode
  #field :arrival_address
  #field :arrival_location, type: Array, spacial: {lng: :longitude, lat: :latitude, return_array: true }
  #field :unload_point

  #field :gmaps, type: Boolean
  #field :pickup_date, type: Date
  #field :load_date, type: Date
  #field :unload_date, type: Date
  #field :waybill_no
  #field :waybill_type
  #field :waybill_page
  #field :statement
  #field :statement_date, type: Date
  #field :commodity
  #field :producer
  #field :marks_nos
  #field :load_type
  #belongs_to :custom, :class_name => "Place", :inverse_of => :custom
  #belongs_to :customofficer, :class_name => "Company", :inverse_of => :customofficer
  belongs_to :presenter, :class_name => "Company", :inverse_of => :presenter
  belongs_to :bank, :class_name => "Company", :inverse_of => :bank
  #field :bank_flag, type: Boolean
  #field :hts_no
  #field :brut_wg, type: Float
  #field :volume, type: Float
  #field :ladameter, type: Float
  #field :chg_wg, type: Float
  #field :freight_price, type: Float
  #field :freight_curr
  #field :agent_price, type: Float, default: 0;
  #field :agent_curr
  #field :agent_share
  #field :product_price, type: Float
  #field :product_curr

  belongs_to :user
  belongs_to :saler, :class_name => "User", :inverse_of => :saler, :foreign_key => "saler_id" 

  #field :status, default: 'A'
  #field :stage, default: 'R'
  #field :stage_date, type: Date
  #field :agent_reference
  #field :customer_reference
  #field :other_reference
  #field :loading_note
  #field :delivery_note
  #field :wagon_no
  #slug  :reference, :scope => :patron, :permanent => true
  #auto_increment :rec_number
  
  has_one  :departure
  has_one  :arrival
  has_many :containers
  has_many :packages
  has_many :waybills, as: :waybillable, dependent: :delete
  has_many :comments, as: :commentable, dependent: :delete

  #validates_presence_of :reference, :except => :create
  validates_uniqueness_of :reference, :case_sensitive => false
  validates_presence_of :operation, :direction, :patron_id, :patron_token, :branch_id
  validates_presence_of :company
  validates_associated :company
  validates_presence_of :commodity
  validates_presence_of :user

  scope :patron, ->(token) { where(patron_token: token) }
  scope :active, where(status: "A")
  scope :air, where(operation: "air")
  scope :sea, where(operation: "sea")
  scope :road, where(operation: "road")
  scope :rail, where(operation: "rail")
  scope :export, where(direction: "E")
  scope :import, where(direction: "I")
  scope :newones, order_by(:created_at, :desc)
  scope :reservations, where(position_id: nil)
  scope :plannedloads, where(:position_id.exists => true)

  before_create :set_initials
  before_save   :get_coordinates
  after_create  :set_after_jobs

  private
  def set_initials
    counter = self.patron.generate_counter("Loading", self.operation, self.direction)
    self.reference = self.operation + "." + self.direction + "." + sprintf('%07d', counter)
    self.patron_token = current_patron.token if self.patron_token.blank?
    generate_slug!
  end

  def set_after_jobs
    self.user.follow(self) if self.user
    self.user.create_activity(self, reference, patron_id, patron_token)
    #patron.set_activity(self, 'create', user.id, 'created', user.full_name)
    Patron.journal_record(patron, user, branch, nil, self.class.name, 1, 0)
  end

  def gmaps4rails_address_departure
    "#{self.departure_address}, #{self.departure_district}, #{self.departure_city.name}, #{self.departure_country.name}"
  end

  def gmaps4rails_address
    "#{self.arrival_address}, #{self.arrival_district}, #{self.arrival_city.name}, #{self.arrival_country.name}"
  end

  def get_coordinates
    if self.departure_address.present?
      self.departure_location = Gmaps4rails.geocode(gmaps4rails_address_departure).first
    end
    if self.arrival_address.present?
      self.arrival_location   = Gmaps4rails.geocode(gmaps4rails_address).first
    end
  end

  def longitude
    self.arrival_location[0]
  end

  def latitude
    self.arrival_location[1]
  end

  def longitude_departure
    self.departure_location[0]
  end

  def latitude_departure
    self.departure_location[1]
  end

  class << self
    def incoterms()
      incoterms = {
        'FOB' => 'FOB',
        'CIF' => 'CIF',
        'COB' => 'COB'
      }
    end

    def load_types()
      load_types = {
        'F' => 'Full',
        'P' => 'Partial',
        'B' => 'Bulk'
      }
    end

    def stages()
      stages = {
        'R' => 'Reservation',
        'B' => 'Booking',
        'C' => 'Closed'
      }
    end

    def point_types()
      point_types = {
        'M' => 'Customer Place',
        'P' => 'Airport'
      }
    end
  end

  public
  def position_name
    if self.position_id.nil?
      "RESERVATION"
    else
       self.position.reference
    end
  end

  def to_s
    reference
  end
end
