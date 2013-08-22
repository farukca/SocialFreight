class Package < ActiveRecord::Base

  belongs_to :packed, polymorphic: true, counter_cache: true, touch: true
 
  validates_presence_of :total, :pack_type
  validates :pack_type, presence: true, length: { maximum: 255 }
  validates :total, numericality: true
  validates :dimension1, :dimension2, :dimension3, numericality: true
  validates :description, length: { maximum: 200 }
  validates :loading_notes, length: { maximum: 200 }
  validates :container_no, length: { maximum: 40 }
  validates :imo, :gtip, :po, length: { maximum: 20 }

  default_scope { where(patron_id: Nimbos::Patron.current_id) }

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
  def to_s
    "#{self.total} #{self.pack_type} (#{self.dimension1}X#{self.dimension2}#{self.dimension3})"
  end
end
