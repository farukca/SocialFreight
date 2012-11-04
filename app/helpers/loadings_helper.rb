module LoadingsHelper
  
  def loading_name(loading = @loading)
  	loading.reference
  end

end
