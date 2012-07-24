class Package < ActiveRecord::Base

  #belongs_to :loading
  #belongs_to :container
  belongs_to :packed, polymorphic: true
 
  validates_presence_of :total, :pack_type#, :packed_type, :packed_id

  class << self
    def pack_types()
      pack_types = {
        'PARCEL' => 'Parcel',
        'BOXES'  => 'Box',
        'PACK'   => 'Package',
        'SACK'   => 'Sack',
        'PALLET' => 'Pallet'
      }
    end
  end

  public
  def header
    "#{self.total} #{self.pack_type} (#{self.dimension1}X#{self.dimension2}#{self.dimension3})"
  end
end
