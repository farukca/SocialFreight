class Team < ActiveRecord::Base
  extend FriendlyId

  #belongs_to :patron
  friendly_id :name, use: :slugged, use: :scoped, scope: :patron_id

  default_scope { where(patron_id: Patron.current_id) }  

end
