class Betauser < ActiveRecord::Base

  include CustomValidators::Validators

  attr_accessor :username
  attr_accessible :email, :name, :company, :phone, :username

  validates :email, presence: true, length: { in: 7..60 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates :name, presence: true, length: { in: 2..100 }
  validates :company, length: { maximum: 100 }
  validates :phone, length: { maximum: 30 }

  validates :username, absence: true
end
