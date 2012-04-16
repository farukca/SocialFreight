class Team < ActiveRecord::Base
  #include Mongoid::Document
  #include Mongoid::Timestamps
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :patron
  #field :patron_token
  #field :name

  #has_many :journals, as: :journaled, dependent: :destroy

end
