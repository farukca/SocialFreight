class Loading
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :reference
  belongs_to :position
  field :operation
  field :direction
  field :incoterm
  field :paid_at
  belongs_to :patron
  field :patron_token
  belongs_to :branch
  belongs_to :company
  belongs_to :loader, :class_name => Company, :inverse_of => :loader
  belongs_to :sender, :class_name => Company, :inverse_of => :sender
  belongs_to :consignee, :class_name => Company, :inverse_of => :consignee
  belongs_to :notify, :class_name => Company, :inverse_of => :notify
  belongs_to :notify2, :class_name => Company, :inverse_of => :notify2
  belongs_to :deliver, :class_name => Company, :inverse_of => :deliver
  belongs_to :agent, :class_name => Company, :inverse_of => :agent
  belongs_to :load_place, :class_name => Place, :inverse_of => :load_place
  field :load_date, type: Date
  belongs_to :unload_place, :class_name => Place, :inverse_of => :unload_place
  field :unload_date, type: Date

  field :statement
  field :statement_date, type: Date
  field :commodity
  field :marks_nos
  #belongs_to :custom
  belongs_to :customofficer, :class_name => Company, :inverse_of => :customofficer
  belongs_to :producer, :class_name => Company, :inverse_of => :producer
  belongs_to :presenter, :class_name => Company, :inverse_of => :presenter
  belongs_to :bank, :class_name => Company, :inverse_of => :bank
  field :hts_no
  field :volume, type: Float
  field :chg_volume, type: Float
  field :brut_wg, type: Float
  field :chg_wg, type: Float
  field :freight_price, type: Float
  field :freight_price_curr

  belongs_to :user
  belongs_to :saler, :class_name => User, :inverse_of => :saler, :foreign_key => "saler_id" 

  field :status
  field :agent_reference
  field :other_reference
  field :description
  slug :reference
  
  #has_many :containers
  #has_many :packages

  #validates_confirmation_of :reference
  validates_presence_of :reference, :on => :create
  validates_uniqueness_of :reference, :case_sensitive => false
  validates_presence_of :operation, :direction, :patron_id, :patron_token, :branch_id

  class << self
    def incoterms()
      incoterms = {
        'FOB' => 'FOB',
        'CIF' => 'CIF',
        'COB' => 'COB'
      }
    end
  end
end
