class Payoff < ActiveRecord::Base

  extend FriendlyId

  has_many :fuels
  has_many :payments
  has_many :costs
  
  belongs_to :transport
  belongs_to :staff, :class_name => "Person", :foreign_key => "staff_id"
  belongs_to :patron
  friendly_id :name, use: :slugged, use: :scoped, scope: :patron

  attr_accessible :approved, :arrival_date, :arrival_km, :arrival_place, :departure_date, :departure_km, :departure_place, 
                  :name, :notes, :payoff_date, :payoff_type, :return_date, :return_km, :return_place, :staff_id, 
                  :transport_id, :truck, :vehicle, :voyage

  validates :name, :payoff_date, :staff_id, :payoff_type, :user_id, :patron_id, presence: true
  validates :departure_km, :arrival_km, :return_km, :numericality => { :only_integer => true }

  before_create :set_initials


  private
  def set_initials
    self.name = self.patron.generate_counter("Payoff", nil, nil)
    set_slug(self.name)
  end

end
