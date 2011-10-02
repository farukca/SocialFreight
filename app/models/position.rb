class Position
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :reference
  field :operation
  field :direction
  field :paid_at
  belongs_to :patron
  field :patron_key
  belongs_to :branch
  field :master_reference
  field :master_type
  field :master_date
  belongs_to :transporter, :class_name => Company, :inverse_of => :transporter, :foreign_key => "transporter_id"
  belongs_to :forwarder, :class_name => Company, :inverse_of => :forwarder, :foreign_key => "forwarder_id"
  belongs_to :agent, :class_name => Company, :inverse_of => :agent, :foreign_key => "agent_id"
  field :voyage
  field :vessel
  field :driver
  field :vessel2
  field :driver2
  belongs_to :load_place, :class_name => Place, :inverse_of => :load_place, :foreign_key => "load_place_id"
  field :load_date, type: Date
  belongs_to :unload_place, :class_name => Place, :inverse_of => :unload_place, :foreign_key => "unload_place_id"
  field :unload_date, type: Date
  field :status
  field :contract_no
  field :agent_reference
  field :other_reference
  field :description
  

  has_many :loadings, dependent: :nullify
  #embeds_many :transfers
  #embeds_many :multimodals

  #attr_accessible 

  #validates_confirmation_of :password
  validates_presence_of :reference, :on => :create
  validates_uniqueness_of :reference, :case_sensitive => false
  validates_presence_of :operation, :direction, :patron_id, :patron_key, :branch_id

end
