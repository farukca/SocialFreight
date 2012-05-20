class Team < ActiveRecord::Base
  extend FriendlyId

  belongs_to :patron
  friendly_id :name, use: :slugged, use: :scoped, scope: :patron
  

end
