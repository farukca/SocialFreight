module PeopleHelper
  
  def person_name(person=@person)
  	person.to_s
  end

end