class Findoc < ActiveRecord::Base

  belongs_to :user
  belongs_to :patron
  
  
end
