module ApplicationHelper
  
  include Twitter::Autolink
  
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end

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

  def new_record_path(model_type, parent=nil)
    if parent.nil?
      send("new_#{model_type.to_s}_path")
    else
      send("new_#{model_type.to_s}_path", "#{parent.class.to_s.downcase}_id" => parent.id)
    end
  end

  def edit_record_path(object)
    send("edit_#{object.class.to_s.downcase}_path", id: object.id)
  end

  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end

  def navigator(navid, navurl, navtext, navicon)
    content_tag :li, class: ((navid == current_tab) ? "active" : "") do
      link_to (((content_tag :i, "", class: "#{navicon}") + "#{navtext}")), navurl
    end
  end

  def created_time(ctime)
    ctime.strftime("%d/%m/%Y %H:%M")
  end
end
