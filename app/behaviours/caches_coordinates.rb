module CachesCoordinates

  def self.included(base)
    base.send(:before_save, :cache_coordinates)
  end

  def cache_coordinates
    self.lat, self.lng = geocode(formatted_address)
  end

  private
  def formatted_address_for_geocoding
    "#{address1} #{city}"
  end

  def geocode(search_term)
    RestClient.get(geocoding_url(search_term)).values_at(:lat, :lng)
  end

  def geocoding_url(search_term)
    "http://example.com/geocode?x=#{CGI::escape search_term}"
  end

end