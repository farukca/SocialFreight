class Betauser < ActiveRecord::Base

  include CustomValidators::Validators

  attr_accessor :username

  validates :email, presence: true, length: { in: 7..60 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates :username, absence: true
end
