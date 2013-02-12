module GeneratesNick

  def self.included(base)
    base.send(:after_create, :generate_nick)
  end

  def generate_nick
    cleared_socialname = clear_socialname(self.to_s)
    unless cleared_socialname.blank?
      Nick.log(self, cleared_socialname, self.patron_id)
    end
  end

  private
  def clear_socialname(socialname)
    socialname.gsub(/[^0-9A-Za-z]/, '').downcase
  end

end