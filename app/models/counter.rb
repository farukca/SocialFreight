class Counter < ActiveRecord::Base

  belongs_to :patron

  attr_accessible :counter_type, :operation, :patron_id, :prefix, :suffix, :period, :count

  validates_presence_of :counter_type

  def get_reference
    strRef = ""
    strRef << self.prefix if self.prefix
    strRef << sprintf('%07d', self.count)
    strRef << self.suffix if self.suffix
    return strRef.upcase
  end

end
