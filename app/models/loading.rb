class Loading
  include Mongoid::Document
  include Mongoid::Timestamps

  field :reference
  belongs_to :position
  field :operation
  field :direction
  field :incoterm
  field :paid_at
  belongs_to :patron
  field :patron_key
  belongs_to :branch
  belongs_to :company, :class_name => Company, :inverse_of => :company, :foreign_key => "company_id" 
  belongs_to :loader, :class_name => Company, :inverse_of => :loader, :foreign_key => "loader_id" 
  belongs_to :sender, :class_name => Company, :inverse_of => :sender, :foreign_key => "sender_id" 
  belongs_to :consignee, :class_name => Company, :inverse_of => :consignee, :foreign_key => "consignee_id" 
  belongs_to :notify, :class_name => Company, :inverse_of => :notify, :foreign_key => "notify_id"
  belongs_to :notify2, :class_name => Company, :inverse_of => :notify2, :foreign_key => "notify2_id"
  belongs_to :delivery, :class_name => Company, :inverse_of => :delivery, :foreign_key => "delivery_id" 
  belongs_to :agent, :class_name => Company, :inverse_of => :agent, :foreign_key => "agent_id" 
  belongs_to :load_place, :class_name => Place, :inverse_of => :load_place, :foreign_key => "load_place_id"
  field :load_date, type: Date
  belongs_to :unload_place, :class_name => Place, :inverse_of => :unload_place, :foreign_key => "unload_place_id"
  field :unload_date, type: Date

  field :statement_no
  field :statement_date, type: Date
  field :commodity
  field :marks_nos
  belongs_to :producer, :class_name => Company, :inverse_of => :producer, :foreign_key => "producer_id" 
  belongs_to :presenter, :class_name => Company, :inverse_of => :presenter, :foreign_key => "presenter_id" 
  belongs_to :bank, :class_name => Company, :inverse_of => :bank, :foreign_key => "bank_id" 
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
  
  #has_many :containers
  #has_many :packages

  #validates_confirmation_of :reference
  validates_presence_of :reference, :on => :create
  validates_uniqueness_of :reference, :case_sensitive => false
  validates_presence_of :operation, :direction, :patron_id, :patron_key, :branch_id
end
