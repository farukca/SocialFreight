module PatronsHelper

  def patron_name(patron=@patron)
  	patron.name
  end

  def patron_title(patron=@patron)
  	patron.title
  end

end
