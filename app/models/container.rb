class Container < ActiveRecord::Base

  belongs_to :loading

  has_many :packages, as: :packed, dependent: :destroy
  accepts_nested_attributes_for :packages

  attr_accessible :name, :sealno, :container_type, :free_day, :demurrage, :demurrage_curr, :notes,
                  :packages_attributes
  
  validates_presence_of :name, :container_type, :loading
  #validates_length_of   :code, :maximum => 2  
  
  default_scope { where(patron_id: Patron.current_id) }

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

    def air_container_types()
      air_container_types = {
        '20DRY' => '20 Dry',
        '20FRA' => '20 Flat Rack',
        '20OPT' => '20 Open Top',
        '20RFR' => '20 Reefer'
      }
    end
  end

  public
  def header
    #"#{self.name} #{self.container_type} (#{self.sealno})"
    "#{self.container_type}-#{self.name}"
  end

end
