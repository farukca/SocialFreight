module LoadingsHelper
  
  def loading_name(loading = @loading)
  	loading.reference
  end

  def loading_freight_price(loading=@loading)
  	"#{number_to_currency(loading.freight_price, precision: 2)} #{loading.freight_curr}"
  end

  def loading_brut_weight(loading=@loading)
  	"#{loading.brut_wg} #{loading.weight_unit}"
  end
end
