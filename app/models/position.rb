class Position
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  
  field :reference
  field :operation
  field :direction
  field :paid_at
  field :mwb_no
  field :emwb_no
  belongs_to :patron
  field :patron_token
  belongs_to :branch
  field :master_reference
  field :master_type
  field :master_date
  belongs_to :transporter, :class_name => "Company", :inverse_of => :transporter_positions
  belongs_to :forwarder, :class_name => "Company", :inverse_of => :forwarder_positions
  belongs_to :supplier, :class_name => "Company", :inverse_of => :supplier_positions
  belongs_to :agent, :class_name => "Company", :inverse_of => :agent_positions
  field :voyage
  field :vessel
  field :driver
  field :voyage2
  field :vessel2
  field :driver2
  field :ownership
  field :load_type
  belongs_to :load_place, :class_name => "Place", :inverse_of => :load_place
  field :load_date, type: Date
  field :load_time
  belongs_to :unload_place, :class_name => "Place", :inverse_of => :unload_place
  field :unload_date, type: Date
  field :unload_time
  field :freight_price, type: Float, default: 0;
  field :freight_curr
  field :agent_price, type: Float, default: 0;
  field :agent_curr
  field :status, default: 'A'
  field :stage, default: 'R'
  field :stage_date, type: Date
  field :contract_no
  field :agent_reference
  field :other_reference
  field :tircarnet1
  field :tircarnet2
  field :ex1
  field :description
  field :ordino_date, type: Date
  field :sob_date, type: Date
  field :report_date, type: Date
  belongs_to :user
  slug  :reference, :scope => :patron, :permanent => true
  auto_increment :rec_number

  has_many :loadings, dependent: :nullify
  has_many :transnodes
  #embeds_many :transfers

  before_create :set_initials

  #attr_accessible 

  #validates_confirmation_of :password
  validates_presence_of :reference, :on => :update
  validates_presence_of :operation #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :direction #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :patron #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :patron_token #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :branch #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_uniqueness_of :reference, :case_sensitive => false #burada patron_id değerine göre unique key olmalı
  #validates_presence_of :load_place #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  #validates_presence_of :unload_place #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :load_date #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :unload_date #, :message => I18n.t('tasks.errors.name.cant_be_blank')

  scope :patron, ->(token) { where(patron_token: token) }
  scope :active, where(status: "A")
  scope :air, where(operation: "air")
  scope :sea, where(operation: "sea")
  scope :road, where(operation: "road")
  scope :rail, where(operation: "rail")
  scope :export, where(direction: "E")
  scope :import, where(direction: "I")

  #scope :washed_up, where(:age.gt => 30)
  scope :last, order_by(:created_at, :desc)

  private
  def set_initials
    counter = self.patron.generate_counter("Position", self.operation, self.direction)
    self.reference = self.operation + "." + self.direction + "." + sprintf('%07d', counter)
    #self.patron_token = current_patron.token if self.patron_token.blank?
    generate_slug!
  end

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

end
