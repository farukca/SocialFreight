class Loading < ActiveRecord::Base

  acts_as_followable
  acts_as_likeable
  extend FriendlyId


  belongs_to :patron  
  friendly_id :reference, use: :slugged, use: :scoped, scope: :patron
  
  belongs_to :position
  belongs_to :branch
  belongs_to :company
  belongs_to :agent, :class_name => "Company", :foreign_key => "agent_id"
  #belongs_to :bank, :class_name => "Company", :foreign_key => "bank_id"
  belongs_to :user
  belongs_to :saler, :class_name => "User", :foreign_key => "saler_id"

  has_many   :departures
  has_many   :arrivals
  accepts_nested_attributes_for :departures, :arrivals

  has_many :containers
  has_many :packages
  has_many :waybills, as: :waybillable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  
  #validates_presence_of :reference, :except => :create
  validates_uniqueness_of :reference, :case_sensitive => false
  validates_presence_of :operation, :direction, :patron_id, :patron_token, :branch_id
  validates_presence_of :company_id
  #validates_associated :company
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
        'M' => 'Customer Place',
        'P' => 'Airport',
        'S' => 'Seaport',
        'R' => 'Rail Station',
        'K' => 'Konsolidasyon Merkezi'
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

  private
  def set_initials
    #counter = self.patron.generate_counter("Loading", self.operation, nil)
    #self.reference = self.operation + "." + self.direction + "." + sprintf('%07d', counter)
    self.reference = self.patron.generate_counter("Loading", self.operation, nil)
    self.patron_token = current_patron.token if self.patron_token.blank?
    set_slug(self.reference)
  end
  private
  def set_after_jobs
    self.user.follow!(self) if self.user
    self.user.create_activity(self, reference, patron_id, patron_token)
    #patron.set_activity(self, 'create', user.id, 'created', user.full_name)
    Patron.journal_record(patron, user, branch, nil, self.class.name, 1, 0)
    Nick.log(self, self.slug, patron_id)
  end
  
end
