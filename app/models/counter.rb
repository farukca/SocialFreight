class Counter
  include Mongoid::Document

  field :counter_type
  field :operation
  field :direction
  field :count, :type => Integer, default: 0
  embedded_in :patron

  validates_presence_of :counter_type

end
