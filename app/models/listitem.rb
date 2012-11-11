class Listitem < ActiveRecord::Base

  def to_partial_path() 
  	"listheaders/listitem" 
  end

  belongs_to :listheader
  
  attr_accessible :code, :i18n_code, :list_code, :name
end
