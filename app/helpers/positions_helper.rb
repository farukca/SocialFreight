module PositionsHelper

  def position_name(position=@position)
    position.reference
  end

end
