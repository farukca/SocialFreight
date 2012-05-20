class Vehicle < ActiveRecord::Base
  #include Mongoid::Document
  #include Mongoid::Timestamps
  #include Mongoid::Token
  #include Mongoid::Followee
  extend FriendlyId

  belongs_to :patron
  friendly_id :code, use: :slugged, use: :scoped, scope: :patron
  
  belongs_to :country

  def token_inputs
    { :id => code, :name => code }
  end

  def prepopulate_tokens
    [{ :id => _id, :name => code }]
  end

  def to_s
    code
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
