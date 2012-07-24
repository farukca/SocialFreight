module ApplicationHelper
  
  include Twitter::Autolink
  
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association, partial_file=nil)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      unless partial_file.nil?
        render(partial_file, :f => builder)
      else
        render(association.to_s.singularize + "_fields", :f => builder)
      end
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

end
