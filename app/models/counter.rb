class Counter < ActiveRecord::Base


  attr_accessible :counter_type, :operation, :prefix, :suffix, :period, :count

  validates_presence_of :counter_type

  default_scope { where(patron_id: Patron.current_id) }
  
  def get_reference
    strRef = ""
    strRef << self.prefix if self.prefix
    strRef << sprintf('%07d', self.count)
    strRef << self.suffix if self.suffix
    return strRef.upcase
  end

end
