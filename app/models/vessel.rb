class Vessel < ActiveRecord::Base
  validates_presence_of :name, :length => { :maximum => 40 }
end
