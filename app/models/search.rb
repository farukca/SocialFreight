class Search < ActiveRecord::Base

  def positions
    @positions = find_positions
  end

  def loadings
    @loadings = find_loadings
  end

  def reservations
    @reservations = find_reservations
  end

  private
  def find_positions
    positions = Position.patron(self.patron_token).active
    positions = positions.where(operation: self.operation) if self.operation.present?
    positions = positions.where(direction: self.direction) if self.direction.present?
    positions = positions.where(branch_id: self.branch) if self.branch.present?
    positions
  end

  private
  def find_loadings
    loadings = Loading.patron(self.patron_token).active
    loadings = loadings.where(operation: self.operation) if self.operation.present?
    loadings = loadings.where(direction: self.direction) if self.direction.present?
    loadings
  end

  private
  def find_reservations
    reservations = Loading.patron(self.patron_token).active.reservations
    reservations = reservations.where(operation: self.operation) if self.operation.present?
    reservations = reservations.where(direction: self.direction) if self.direction.present?
    reservations
  end
  
  class << self
    def operation_models()
      master_types = {
        'loadings'     => 'Loadings',
        'reservations' => 'Reservations',
        'positions'    => 'Positions'
      }
    end
  end
end
