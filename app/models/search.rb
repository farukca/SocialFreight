class Search
  #include Mongoid::Document
  #include Mongoid::Timestamps

  #field :model
  #field :user_id
  #field :patron_id
  #field :patron_token
  #field :reference
  #field :operation
  #field :direction
  #field :paid_at
  #field :docdate1, type: Date
  #field :docdate2, type: Date
  #field :master_type
  #field :branch
  #field :saler_id
  #field :driver_id
  #field :company_id
  #field :transporter_id
  #field :country
  #field :city
  #field :searched, type: Boolean, default: true

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
end
