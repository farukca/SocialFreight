class Currate < ActiveRecord::Base
  
  belongs_to :bank, foreign_key: "bankid"

  attr_accessible :bank_refid, :bankid, :banknote_buying, :banknote_selling, :buying, :ctime, 
                  :cur1, :cur2, :rate, :rate_date, :selling

end
