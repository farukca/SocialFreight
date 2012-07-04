class Currency < ActiveRecord::Base

  self.primary_key = 'code'

  attr_accessible :code, :name, :symbol, :multiplier

  validates_presence_of :code
  validates_presence_of :name
  validates_uniqueness_of :code, :case_sensitive => false
  validates_uniqueness_of :name, :case_sensitive => false

end
