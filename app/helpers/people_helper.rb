module PeopleHelper
  
  def person_name(person=@person)
  	"#{person.name} #{person.surname}"
  end

end