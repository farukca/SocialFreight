class Loading < ActiveRecord::Base

  acts_as_followable
  acts_as_likeable
  extend FriendlyId
  include GeneratesNick
  include GeneratesActivity

  belongs_to :patron
  friendly_id :reference, use: :slugged, use: :scoped, scope: :patron
  
  belongs_to :position, counter_cache: true, touch: true
  belongs_to :branch
  belongs_to :company
  belongs_to :agent, :class_name => "Company", :foreign_key => "agent_id"
  #belongs_to :bank, :class_name => "Company", :foreign_key => "bank_id"
  belongs_to :sender, :class_name => "Company", :foreign_key => "sender_id"
  belongs_to :consignee, :class_name => "Company", :foreign_key => "consignee_id"

  belongs_to :user
  belongs_to :saler, :class_name => "User", :foreign_key => "saler_id"
  belongs_to :creater, :class_name => "User", :foreign_key => "creater_id"
  belongs_to :updater, :class_name => "User", :foreign_key => "updater_id"

  has_many   :departures
  has_many   :arrivals
  accepts_nested_attributes_for :departures, :arrivals

  has_many :containers
  has_many :packages, as: :packed, dependent: :destroy
  accepts_nested_attributes_for :packages, :containers
    
  #has_many :waybills, as: :waybillable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :documents, as: :documented, dependent: :destroy
  has_many :costs, as: :costable, dependent: :destroy
  has_many :invoitems, as: :invoitem_owner, dependent: :destroy

  attr_accessible :position_id, :operation, :direction, :incoterm, :paid_at, :load_type, :channel, :branch_id, :company_id,
                  :agent_id, :user_id, :saler_id, :freight_price, :freight_curr, :agent_price, :agent_curr, :agent_share,
                  :product_price, :product_curr, :bank_flag, :bank_id, :producer, :marks_nos, :hts_no, :brut_wg, 
                  :volume, :ladameter, :price_wg, :commodity, :notes, :load_coun, :unload_coun, :status, :stage, :stage_date,
                  :report_date, :sender_id, :consignee_id, :waybill_no, :waybill_date, :packages_attributes, :containers_attributes

  validates_uniqueness_of :reference, case_sensitive: false, scope: :patron_id
  validates_presence_of :reference, on: :update
  validates_presence_of :operation, :direction, :branch_id, :load_coun, :unload_coun, :load_type
  validates_presence_of :company_id
  #validates_associated :company
  validates_presence_of :commodity
  validates_presence_of :user

  default_scope { where(patron_id: Patron.current_id) }
  scope :active, where(status: "A")
  scope :air, where(operation: "air")
  scope :sea, where(operation: "sea")
  scope :road, where(operation: "road")
  scope :rail, where(operation: "rail")
  scope :export, where(direction: "E")
  scope :import, where(direction: "I")
  scope :newones, order("created_at desc")
  scope :reservations, where("position_id IS NULL")
  scope :plannedloads, where("position_id IS NOT NULL")

  before_create :set_initials
  after_create  :set_after_jobs

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
        'P' => 'Partial'#,
        #'B' => 'Bulk'
      }
    end

    def stages()
      stages = {
        'R' => 'Reservation',
        'B' => 'Booking',
        'G' => 'Going on',
        'D' => 'Delivered',
        'C' => 'Closed'
      }
    end

    def point_types()
      point_types = {
        'P' => 'Airport/Seaport/Rail Station',
        'M' => 'Customer Place'
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

  def setup
    if self.operation == 'inland'
      self.direction = "D"
    end
  end

  private
  def set_initials
    #counter = self.patron.generate_counter("Loading", self.operation, nil)
    #self.reference = self.operation + "." + self.direction + "." + sprintf('%07d', counter)
    self.reference = Patron.generate_counter("Loading", self.operation, nil)
    set_slug(self.reference)
  end
  private
  def set_after_jobs
    self.user.follow!(self) if self.user
    #self.user.create_activity(self, reference, patron_id)
    #patron.set_activity(self, 'create', user.id, 'created', user.full_name)
    #Patron.journal_record(patron_id, user, branch, nil, self.class.name, 1, 0)
    #Nick.log(self, self.slug, patron_id)
  end
  
end
