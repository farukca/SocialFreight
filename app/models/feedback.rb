class Feedback < ActiveRecord::Base

  belongs_to :patron

  attr_accessible :name, :email, :msg, :tel, :company

  validates :name, presence: true, length: { in: 2..40 }
  validates :email, presence: true, length: { in: 7..40 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates :msg, length: { maximum: 500 }
  #validates :tel, length: { maximum: 20 }
  #validates :company, length: { maximum: 40 }

end