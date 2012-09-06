class Position < ActiveRecord::Base

  acts_as_followable
  acts_as_likeable
  acts_as_mentionable
  extend FriendlyId
  include GeneratesNick

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
  has_many :comments, as: :commentable, dependent: :destroy

  has_many :transports, dependent: :destroy
  accepts_nested_attributes_for :transports, :reject_if => lambda { |a| a[:trans_method].blank? }, :allow_destroy => true

  attr_accessor :loading_ids

  attr_accessible :operation, :direction, :incoterm, :paid_at, :load_type, :agent_id, :user_id, :load_place_id, :load_date, 
                   :unload_place_id, :unload_date, :freight_price, :freight_curr, :status, :report_date, :stage, :stage_date, 
                   :ref_no1, :ref_type1, :ref_no2, :ref_type2, :ref_no3, :ref_type3, :ref_no4, :ref_type4, :notes, :agent_price, 
                   :agent_curr, :branch_id, :waybill_no, :waybill_date, :transports_attributes, :loading_ids

  validates_presence_of :reference, :on => :update
  validates_presence_of :operation #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :direction #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :patron #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :patron_token #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :branch_id #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  #validates_presence_of :load_place_id
  #validates_uniqueness_of :reference, :case_sensitive => false #burada patron_id değerine göre unique key olmalı
  #validates_presence_of :load_date #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  #validates_presence_of :unload_date #, :message => I18n.t('tasks.errors.name.cant_be_blank')

  #validates_inclusion_of :operation, in: ["air","sea","road","rail","inland"]
  #validates_inclusion_of :direction, in: ["E","I","T"]
  validates_numericality_of :freight_price
  validates_numericality_of :agent_price

  scope :patron, ->(token) { where(patron_token: token) }
  scope :active, where(status: "A")
  scope :air, where(operation: "air")
  scope :sea, where(operation: "sea")
  scope :road, where(operation: "road")
  scope :rail, where(operation: "rail")
  scope :inland, where(operation: "inland")
  scope :export, where(direction: "E")
  scope :import, where(direction: "I")

  #scope :washed_up, where(:age.gt => 30)
  scope :newones, order("created_at desc")

  before_create :set_initials
  after_create  :set_after_jobs

  class << self
    def direction_types()
      direction_types = {
        'E' => 'Export',
        'I' => 'Import',
        'T' => 'Transit'
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

  def social_name
    self.slug
  end
  #def normalize_friendly_id(string)
  #  super.upcase.gsub("-", ".")
  #end

  private
  def set_initials
    self.reference = self.patron.generate_counter("Position", self.operation, self.direction)
    #counter = self.patron.generate_counter("Position", self.operation, self.direction)
    #self.reference = self.operation + "." + self.direction + "." + sprintf('%07d', counter)
    #self.patron_token = current_patron.token if self.patron_token.blank?
    set_slug(self.reference.parameterize) #.gsub(/[.?*!^%&/(_)=]/, '').parameterize
  end

  private
  def set_after_jobs
    if self.loading_ids.length > 0
      connect_loadings(self.loading_ids)
    end
    self.user.follow!(self) if self.user
    self.user.create_activity(self, reference, patron_id, patron_token)
    #patron.set_activity(self, 'create', user.id, 'created', user.full_name)
    Patron.journal_record(patron, user, branch, nil, self.class.name, 1, 0)
    #Nick.log(self, self.slug, patron_id)
  end

  private
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
