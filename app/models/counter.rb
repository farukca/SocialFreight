class Counter < ActiveRecord::Base

  belongs_to :patron

  attr_accessible :counter_type, :operation, :patron_id, :prefix, :suffix, :period, :count

  validates_presence_of :counter_type

  def set_reference
    
  end

end
