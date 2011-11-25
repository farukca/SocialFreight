class Loading
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :reference
  field :hwb_no
  belongs_to :position
  field :operation
  field :direction
  field :incoterm
  field :paid_at
  field :channel
  belongs_to :patron
  field :patron_token
  belongs_to :branch
  belongs_to :company
  belongs_to :loader, :class_name => "Company", :inverse_of => :loader
  belongs_to :sender, :class_name => "Company", :inverse_of => :sender
  belongs_to :consignee, :class_name => "Company", :inverse_of => :consignee
  belongs_to :notify, :class_name => "Company", :inverse_of => :notify
  belongs_to :notify2, :class_name => "Company", :inverse_of => :notify2
  belongs_to :deliver, :class_name => "Company", :inverse_of => :deliver
  belongs_to :agent, :class_name => "Company", :inverse_of => :agent

  #Loading address and place infos
  field :load_place_type
  belongs_to :load_place, :class_name => "Place", :inverse_of => :load_place
  belongs_to :departure_country, :class_name => "Country", :inverse_of => :departure_loads
  belongs_to :departure_city, :class_name => "City", :inverse_of => :departure_loads
  field :departure_district
  field :departure_postcode
  field :departure_address

  #Unloading address and place infos
  field :unload_place_type
  belongs_to :unload_place, :class_name => "Place", :inverse_of => :unload_place
  belongs_to :arrival_country, :class_name => "Country", :inverse_of => :arrival_loads
  belongs_to :arrival_city, :class_name => "City", :inverse_of => :arrival_loads
  field :arrival_district
  field :arrival_postcode
  field :arrival_address

  field :pickup_date, type: Date
  field :load_date, type: Date
  field :unload_date, type: Date
  field :waybill_no
  field :waybill_type
  field :waybill_page
  field :statement
  field :statement_date, type: Date
  field :commodity
  field :marks_nos
  field :load_type
  belongs_to :custom, :class_name => "Place", :inverse_of => :custom
  belongs_to :customofficer, :class_name => "Company", :inverse_of => :customofficer
  belongs_to :producer, :class_name => "Company", :inverse_of => :producer
  belongs_to :presenter, :class_name => "Company", :inverse_of => :presenter
  belongs_to :bank, :class_name => "Company", :inverse_of => :bank
  field :bank_flag, type: Boolean
  field :hts_no
  field :brut_wg, type: Float
  field :volume, type: Float
  field :ladameter, type: Float
  field :chg_wg, type: Float
  field :freight_price, type: Float
  field :freight_curr
  field :agent_price, type: Float, default: 0;
  field :agent_curr
  field :agent_share
  field :product_price, type: Float
  field :product_curr

  belongs_to :user
  belongs_to :saler, :class_name => "User", :inverse_of => :saler, :foreign_key => "saler_id" 

  field :status, default: 'A'
  field :stage, default: 'R'
  field :stage_date, type: Date
  field :agent_reference
  field :customer_reference
  field :other_reference
  field :loading_note
  field :delivery_note
  field :wagon_no
  slug  :reference, :scope => :patron, :permanent => true
  auto_increment :rec_number
  
  has_many :containers
  has_many :packages

  before_create :set_initials

  #validates_presence_of :reference, :except => :create
  validates_uniqueness_of :reference, :case_sensitive => false
  validates_presence_of :operation, :direction, :patron_id, :patron_token, :branch_id
  validates_presence_of :company

  scope :patron, ->(token) { where(patron_token: token) }
  scope :active, where(status: "A")
  scope :air, where(operation: "air")
  scope :sea, where(operation: "sea")
  scope :road, where(operation: "road")
  scope :rail, where(operation: "rail")
  scope :export, where(direction: "E")
  scope :import, where(direction: "I")
  scope :last, order_by(:created_at, :desc)

  private
  def set_initials
    counter = self.patron.generate_counter("Loading", self.operation, self.direction)
    self.reference = self.operation + "." + self.direction + "." + sprintf('%07d', counter)
    self.patron_token = current_patron.token if self.patron_token.blank?
    generate_slug!
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
  end

  def position_name
    if self.position.nil?
      "RESERVATION"
    else
       self.position.reference
    end
  end
end
