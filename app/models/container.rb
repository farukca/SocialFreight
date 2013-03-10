class Container < ActiveRecord::Base

  belongs_to :loading, counter_cache: true, touch: true

  has_many :packages, as: :packed, dependent: :destroy
  accepts_nested_attributes_for :packages

  attr_accessible :name, :sealno, :container_type, :free_day, :demurrage, :demurrage_curr, :notes,
                  :packages_attributes, :loading_id
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :container_type, presence: true, length: { maximum: 40 }
  validates :loading_id, presence: true
  validates :notes, length: { maximum: 200 }
  validates :sealno, length: { maximum: 40 } 
  #validates :free_day, numericality: true
  #validates :demurrage, numericality: true

  default_scope { where(patron_id: Patron.current_id) }

  public
  def header
    #"#{self.name} #{self.container_type} (#{self.sealno})"
    "#{self.container_type}-#{self.name}"
  end

end
