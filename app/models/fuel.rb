class Fuel < ActiveRecord::Base

  belongs_to :patron
  belongs_to :branch
  belongs_to :staff, class_name: User
  belongs_to :payoff
  #belongs_to :depot

  attr_accessible :amount_type, :branch_id, :depot_id, :document_date, :document_no, :fuel_amount, :fuel_price,
                  :notes, :payment_card, :payment_type, :payoff_id, :price_curr, :process_date, :process_type,
                  :staff_id, :truck, :vehicle

  
end
