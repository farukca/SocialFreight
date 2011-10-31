class Container
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :sealno
  field :container_type
  field :free_day, type: Integer
  field :demurrage, type: Float
  field :demurrage_curr
  field :notes
  belongs_to :loading
  auto_increment :rec_number

  has_many :packages

  #before_create :set_initials  

  attr_accessible :name, :sealno, :container_type, :free_day, :demurrage, :demurrage_curr, :notes
  
  validates_presence_of :name, :container_type, :loading
  #validates_length_of   :code, :maximum => 2  
  
  #def set_initials
  #   self.name = self.code1 + "-" + self.code2 + "-" + self.code3
  #end

  class << self
    def container_types()
      container_types = {
        '20DRY' => '20 Dry',
        '20FRA' => '20 Flat Rack',
        '20OPT' => '20 Open Top',
        '20RFR' => '20 Reefer',
        '20IST' => '20 Iso Tank',
        '40DRY' => '40 Dry',
        '40HCD' => '40 High Cube Dry',
        '40FRA' => '40 Flat Rack',
        '40PLA' => '40 Platform',
        '40OPT' => '40 Open Top',
        '40RFR' => '40 Reefer',
        '40CEL' => '40 Cellular Palette',
        '40HCP' => '40 High Cube Palette Wide'
      }
    end
  end

end
