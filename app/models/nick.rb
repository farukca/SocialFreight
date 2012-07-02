class Nick < ActiveRecord::Base

  belongs_to :patron
  belongs_to :nicknamed, polymorphic: true

  def self.log(target, slug, patron_id)
  	clean_slug = slug.gsub(/[-_.*#!'$%&]/,'').downcase
    nick = Nick.new(:nicknamed => target, :name => clean_slug, :patron_id => patron_id)
    nick.save
    
    nick
  end

end