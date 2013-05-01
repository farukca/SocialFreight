module CountriesHelper

  def country_name(country_code)
  	t("countries.#{country_code}") if country_code.present?
  end

end
