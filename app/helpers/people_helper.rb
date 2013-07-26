module PeopleHelper
  
  def person_name(person=@person)
  	person.to_s
  end

  def person_avatar_name(person=@person)
  	user_mini_avatar(person) + person.to_s
  end

end