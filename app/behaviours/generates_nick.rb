module GeneratesNick

  def self.included(base)
    base.send(:after_save, :generate_nick)
  end

  def generate_nick
    cleared_socialname = clear_socialname(self.social_name)
    Nick.log(self, cleared_socialname, self.patron.id)
  end

  private
  def clear_socialname(socialname)
    socialname
  end

end