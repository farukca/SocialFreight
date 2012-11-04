module OperationsHelper

  def operation_name(operation=@operation)
  	operation.to_s.humanize
  end

  def direction_name(direction)
  	Position.direction_types[direction]
  end

  def incoterm_name(incoterm)
    content_tag :span, class: "incoterm" do
      incoterm
    end
  end

end
