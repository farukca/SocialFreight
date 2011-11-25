class Vehicle
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Token

  field :code
  belongs_to :country
  field :vehicle_type
  field :vehicle_class
  field :brand
  field :model
  field :model_year
  field :status
  field :ownership
  field :vehicle_price
  field :price_curr
  field :fuel_capacity
  field :fuel_capacity2
  field :fuel_type
  field :sat_no
  field :barcode
  field :tire_size
  field :link_type

  token :length => 25, :contains => :alphanumeric
  auto_increment :rec_number

  def token_inputs
    { :id => code, :name => code }
  end

  def prepopulate_tokens
    [{ :id => _id, :name => code }]
  end

  class << self
    def vehicle_classes()
      vehicle_classes = {
        'TRLR' => 'Trailer',
        'TRCK' => 'Truck/TIR',
        'LRRY' => 'Lorry/Bogie',
        'RMRK' => 'Romork',
        'PCKP' => 'Van/Pickup',
        'OTOB' => 'Otobus',
        'OTOM' => 'Otomobile',
        'MOTO' => 'Motorcycle'
      }
    end

    def vehicle_statuses()
      vehicle_statuses = {
        'A' => 'Active',
        'S' => 'Sold',
        'P' => 'Pert'
      }
    end

    def vehicle_ownerships()
      vehicle_ownerships = {
        'O' => 'Firm Property',
        'P' => 'Has Partnership',
        'R' => 'Rented'
      }
    end

    def fuel_types()
      fuel_types = {
        'DIESEL' => 'Diesel',
        'FUEL' => 'Motor Fuel',
        'GAS' => 'Auto Gas'
      }
    end

  end

end
