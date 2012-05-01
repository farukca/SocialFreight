class Operation < ActiveRecord::Base

  #has_and_belongs_to_many :patrons
  #attr_accessor :patron_key
  
  OPERATION_TYPES = [:air, :sea, :road, :rail, :inland]
  
  validates_presence_of :code, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :name, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_uniqueness_of :code, :case_sensitive => false
  validates_uniqueness_of :name, :case_sensitive => false

  def to_s
    name
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
    positions = Position.active.where(operation: self.code).limit(10).newones
    positions
  end

  private
  def find_loadings
    loadings = Loading.active.where(operation: self.code).plannedloads.limit(10).newones
    loadings
  end

  private
  def find_reservations
    reservations = Loading.active.where(operation: self.code).reservations.limit(10).newones
    reservations
  end

end
