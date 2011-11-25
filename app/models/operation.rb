class Operation
  include Mongoid::Document
  include Mongoid::Timestamps

  field :code
  field :name
  field :longname
  field :place
  field :description
  key   :code

  attr_accessor :patron_token  
  
  validates_presence_of :code, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :name, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_uniqueness_of :code, :case_sensitive => false
  validates_uniqueness_of :name, :case_sensitive => false

  def positions
    @positions = find_positions
  end

  def loadings
    @loadings = find_loadings
  end

  private
  def find_positions
    positions = Position.patron(self.patron_token).active.where(operation: self.id)#.limit(20).last
    positions
  end

  private
  def find_loadings
    loadings = Loading.patron(self.patron_token).active.where(operation: self.id)#.limit(20).last
    loadings
  end

end
