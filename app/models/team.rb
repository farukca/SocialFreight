class Team
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :patron
  field :patron_token
  field :name

  has_many :journals, as: :journaled, dependent: :delete

end
