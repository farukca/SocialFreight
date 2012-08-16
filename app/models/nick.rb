class Nick < ActiveRecord::Base

  belongs_to :patron
  belongs_to :nicknamed, polymorphic: true

  def self.log(target, slug, patron_id)
  	clean_slug = slug.to_s.parameterize.downcase
  	#TODO check new nick, if it exists
    nick = Nick.new(:nicknamed => target, :name => clean_slug, :patron_id => patron_id)
    nick.save
    
    nick
  end

  #private
  #def nick_exists(nickname, patron_id)
    
  #end

end