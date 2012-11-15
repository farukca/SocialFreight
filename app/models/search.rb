class Search < ActiveRecord::Base

  attr_accessor :session_loading_ids, :listpage

  default_scope { where(patron_id: Patron.current_id) }
  
  def listpage=(listpage)
    listpage = listpage
  end

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
    positions = Position.active
    positions = positions.where(operation: self.operation) if self.operation.present?
    positions = positions.where(direction: self.direction) if self.direction.present?
    positions = positions.where(branch_id: self.branch_id) if self.branch_id.present?
    positions
  end

  private
  def find_loadings
    loadings = Loading.active
    loadings = loadings.where(operation: self.operation) if self.operation.present?
    loadings = loadings.where(direction: self.direction) if self.direction.present?
    loadings.page(listpage).per(10)
  end

  private
  def find_reservations
    reservations = Loading.active.reservations
    reservations = reservations.where(operation: self.operation) if self.operation.present?
    reservations = reservations.where(direction: self.direction) if self.direction.present?
    reservations = reservations.where('id not in (?)', self.session_loading_ids) if self.session_loading_ids.present?
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
