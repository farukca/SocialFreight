module ApplicationHelper

  def selected_navigation(element)
    element == @selected_navigation ? "active" : ""
  end

end
