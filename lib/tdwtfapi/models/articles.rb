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
    def by_date(month, year)
      if year < 1999
        raise "Invalid year argument provided, must be greater than 1999"
      end

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
        endpoint = "#{ENDPOINT_PREFIX}/recent/#{num}"
      end

      request(endpoint)
    end

  end
end