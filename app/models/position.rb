class Position < ActiveRecord::Base

  acts_as_followable
  acts_as_likeable
  acts_as_mentionable
  extend FriendlyId
  include GeneratesNick
  include GeneratesActivity
  
  belongs_to :patron  
  friendly_id :reference, use: :slugged, use: :scoped, scope: :patron
  
  belongs_to :branch
  belongs_to :agent, :class_name => "Company", :foreign_key => "agent_id"
  belongs_to :load_place, :class_name => "Place", :foreign_key => "load_place_id"
  belongs_to :unload_place, :class_name => "Place", :foreign_key => "unload_place_id"
  belongs_to :user

  has_many :loadings, dependent: :nullify
  has_many :costs, as: :costable, dependent: :destroy
  has_many :invoitems, as: :invoitem_owner, dependent: :destroy
  has_many :documents, as: :documented, dependent: :destroy
  #has_many :comments, as: :commentable, dependent: :destroy
  has_many :posts, as: :target, dependent: :destroy

  has_many :transports, dependent: :destroy
  accepts_nested_attributes_for :transports, :reject_if => lambda { |a| a[:trans_method].blank? }, :allow_destroy => true

  attr_accessor :loading_ids

  attr_accessible :operation, :direction, :incoterm, :paid_at, :load_type, :agent_id, :user_id, :load_place_id, :load_date, 
                   :unload_place_id, :unload_date, :freight_price, :freight_curr, :status, :report_date, :stage, :stage_date, 
                   :ref_no1, :ref_type1, :ref_no2, :ref_type2, :ref_no3, :ref_type3, :ref_no4, :ref_type4, :notes, :agent_price, 
                   :agent_curr, :branch_id, :waybill_no, :waybill_date, :description, :transports_attributes, :loading_ids

  validates_uniqueness_of :reference, case_sensitive: false, scope: :patron_id
  validates_presence_of :reference, on: :update
  validates :operation, presence: { message: I18n.t('defaults.inputerror.cant_be_blank') }
  validates :direction, presence: { message: I18n.t('defaults.inputerror.cant_be_blank') }, inclusion: { in: %w(E I T D) }
  validates :branch_id, presence: { message: I18n.t('defaults.inputerror.cant_be_blank') }
  validates :description, presence: { message: I18n.t('defaults.inputerror.cant_be_blank') }, length: { maximum: 255 }
  validates :notes, length: { maximum: 500 }

  default_scope { where(patron_id: Patron.current_id) }
  scope :active, where(status: "A")
  scope :air, where(operation: "air")
  scope :sea, where(operation: "sea")
  scope :road, where(operation: "road")
  scope :rail, where(operation: "rail")
  scope :inland, where(operation: "inland")
  scope :export, where(direction: "E")
  scope :import, where(direction: "I")
  scope :transit, where(direction: "T")
  scope :domestic, where(direction: "D")

  #scope :washed_up, where(:age.gt => 30)
  scope :newones, order("created_at desc")

  before_create :set_initials
  after_create  :set_after_jobs

  class << self
    def direction_types()
      direction_types = {
        'E' => 'Export',
        'I' => 'Import',
        'T' => 'Transit',
        'D' => 'Domestic'
      }
    end
  end

  class << self
    def payment_types()
      payment_types = {
        'PP' => 'PrePaid',
        'CC' => 'CustomCollect'
      }
    end
  end

  class << self
    def master_types()
      master_types = {
        'MO' => 'Master Only',
        'CO' => 'Consolidated'
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

  def to_s
    reference
  end

  #def normalize_friendly_id(string)
  #  super.upcase.gsub("-", ".")
  #end

  def reservations
    @reservations = find_reservations
  end

private
  def set_initials
    self.reference = Patron.generate_counter("Position", self.operation, self.direction)
    set_slug(self.reference.parameterize) #.gsub(/[.?*!^%&/(_)=]/, '').parameterize
  end

  def set_after_jobs
    if self.loading_ids && self.loading_ids.length > 0
      connect_loadings(self.loading_ids)
    end
    self.user.follow!(self) if self.user
  end

  def find_reservations
    reservations = Loading.active.reservation
    reservations = reservations.where(operation: self.operation)
    reservations = reservations.where(direction: self.direction)
    #reservations = reservations.where('id not in (?)', self.session_loading_ids) if self.session_loading_ids.present?
    reservations
  end

  def connect_loadings(loadids)
    loadids.each do |loadid|
      @loading = Loading.find(loadid)
      if @loading && (@loading.operation == self.operation) && (@loading.direction == self.direction) && @loading.position_id.nil?
        #TODO control loading and position attributes
        @loading.update_attributes(:position_id => self.id)
        #@loading.position_id = self.id
        #@loading.save
      end
    end
  end

end
