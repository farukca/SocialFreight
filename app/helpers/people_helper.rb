module PeopleHelper
  
  def person_name(person=@person)
  	person.to_s
  end

  def person_small_avatar(person = @person)
    cl_image_tag(person.avatar_url, width: 48, height: 48, crop: :fill, class: "media-object img-circle")
  end

end