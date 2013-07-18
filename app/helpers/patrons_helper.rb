module PatronsHelper

  def patron_name(patron=@patron)
  	patron.name
  end

  def patron_title(patron=@patron)
  	patron.title
  end

  def patron_logo(patron = @patron)
    cl_image_tag(patron.logo_url, width: 152, height: 60, crop: :fill, class: "media-object")
  end

end
