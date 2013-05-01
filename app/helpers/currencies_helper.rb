module CurrenciesHelper

  def print_price(price, currency)
  	"#{number_to_currency(price, precision: 2)} #{currency}" if price > 0
  end

end