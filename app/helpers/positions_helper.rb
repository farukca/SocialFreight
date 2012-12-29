module PositionsHelper

  def position_name(position=@position)
    link_to position.reference, position
  end

end
