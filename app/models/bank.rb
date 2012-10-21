class Bank < ActiveRecord::Base
  
  has_many :currates

  attr_accessible :code, :country, :currency, :name, :response_type, :service_code, :service_url


  def self.get_rate(bankid)
  	@bank = Bank.find(bankid)
  	if @bank
  	  @ratesjson = JSON.parse(open(@bank.service_url).read)
      unless @ratesjson.nil?
      	if @bank.service_code == "tcmb"
      	  @bank.set_tcmb_rates(@ratesjson)
      	end
      end
  	end

  end

  def set_tcmb_rates(rates)
    rdate = DateTime.strptime("#{rates["yil"]}-#{rates["ay"]}-#{rates["gun"]}T00:00:00+00:00", '%Y-%m-%dT%H:%M:%S%z')
    Currency.all.each do |curr|
      unless curr.code == self.currency
        currcode = curr.code.downcase
        @al = rates["#{currcode}Al"].to_f
        @sat = rates["#{currcode}Sat"].to_f
        @eal = rates["#{currcode}EAl"].to_f
        @esat = rates["#{currcode}ESat"].to_f

        @currate = self.currates.new(rate_date: rdate, cur1: curr.code, cur2: self.currency, buying: @al, selling: @sat, banknote_buying: @eal, banknote_selling: @esat, rate: 1)
        @currate.save!
      end    
    end
    
  end
end
