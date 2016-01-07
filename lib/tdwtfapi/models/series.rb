module TDWTF
  class Series < EndpointResource

    ENDPOINT_PREFIX = :series

    #
    # since 0.1.0
    def by_slug(num = nil)
      endpoint = "#{ENDPOINT_PREFIX}/#{slug}"

      if num
        raise "Count cannot be greater than 100" if num > 100
        
        endpoint = "#{ENDPOINT_PREFIX}/#{slug}/#{num}"
      end

      request(endpoint)
    end
    #
    # since 0.1.0
    def by_date(slug, month, year)
      raise InvalidYearException, "Invalid year argument provided, must be greater than 1999" if year < 1999

      request("#{ENDPOINT_PREFIX}/#{slug}/#{year}/#{month}")
    end

  end
end