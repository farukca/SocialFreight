class Junk < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :junked, polymorphic: true

  attr_accessible :desc, :name, :user_id, :junked_type, :junked_id

  default_scope { where(patron_id: Patron.current_id) }
  scope :latest, order("created_at desc")

  validates :name, :user_id, :junked_type, :junked_id, presence: true

  def self.send_to_junk(user_id, junkedObject, junkedName, description)
    junk = Junk.new(junked: junkedObject, user_id: user_id, name: junkedName, desc: description)
    junk.save!
    junk
  end

end