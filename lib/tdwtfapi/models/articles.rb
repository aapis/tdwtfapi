module TDWTF
  class Articles < EndpointResource
    
    ENDPOINT_PREFIX = :articles

    #
    # since 0.1.0
    def by_id(query)
      request("#{ENDPOINT_PREFIX}/id/#{query}")
    end

    #
    # since 0.1.0
    def by_slug(query)
      request("#{ENDPOINT_PREFIX}/slug/#{query}")
    end

    #
    # since 0.1.0
    def by_month(month, year)
      raise InvalidYearException, "Invalid year argument provided, must be greater than 1999" if year < 1999

      request("#{ENDPOINT_PREFIX}/#{year}/#{month}")
    end

    #
    # since 0.1.0
    def random
      request("#{ENDPOINT_PREFIX}/random")
    end

    #
    # since 0.1.0
    def recent(num = nil)
      endpoint = "#{ENDPOINT_PREFIX}/recent"

      if num
        raise "Count cannot be greater than 100" if num > 100

        endpoint = "#{ENDPOINT_PREFIX}/recent/#{num}"
      end

      request(endpoint)
    end

  end
end