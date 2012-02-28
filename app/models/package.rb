class Package < ActiveRecord::Base
  #include Mongoid::Document
  #include Mongoid::Timestamps

  #field :total, type: Integer
  #field :pack_type
  #field :dimension1, type: Integer
  #field :dimension2, type: Integer
  #field :dimension3, type: Integer
  #field :brutwg, type: Float
  #field :netwg, type: Float
  #field :volume, type: Float
  #field :lada, type: Float
  #field :imo
  #field :gtip
  #field :po
  #field :description
  #field :notes
  belongs_to :loading
  belongs_to :container
  #auto_increment :rec_number
 
  validates_presence_of :total, :pack_type, :loading

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
