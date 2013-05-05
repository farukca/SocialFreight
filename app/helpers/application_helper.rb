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

  def search_form_helper(model_name)
    capture do
      form_for(Search.new, remote: true, class: "form-search") do |f|
        concat f.text_field :reference, class: "input-xlarge search-query", placeholder: t("#{model_name}.defaults.fullsearch_placeholder")
        concat f.hidden_field :model, value: model_name
        concat f.hidden_field :searched, value: "t"
        concat f.submit t("defaults.link.search"), class: "btn"
        concat link_to t("defaults.link.detailed_search"), new_search_path(model: model_name)
      end
    end
  end

  def page_header_helper(title, new_record_path=nil, link_title=nil)
    content_tag :div, class: "page-header" do
      content_tag :h3 do
        concat title
        concat (
          content_tag :small do
            link_to link_title, "#{new_record_path}", class: "btn btn-success header_btn"
          end
        ) if new_record_path
      end
    end
  end

  def page_sub_header(title)
    content_tag :div, class: "page-header" do
      content_tag :h5 do
        concat title
      end
    end
  end

  def page_intro_helper(intro_text)
    content_tag :div, class: "row-fluid" do
      content_tag :p, intro_text
    end
  end

  def sub_header_with_search_form(title, model_name)
    content_tag :div, class: "page-header" do
      content_tag :h5 do
        concat title
        concat (
          content_tag :div, class: "pull-right" do
            search_form_helper(model_name)
          end
        )
      end
    end
  end

end