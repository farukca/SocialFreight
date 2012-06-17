class Nick < ActiveRecord::Base

  belongs_to :patron
  belongs_to :nicknamed, polymorphic: true

  def self.log(target, slug, patron_id)
    nick = Nick.new(:nicknamed => target, :name => slug, :patron_id => patron_id)
    nick.save
    
    nick
  end

end