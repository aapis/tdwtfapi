module TDWTF
  class Author < EndpointResource

    ENDPOINT_PREFIX = :author

    #
    # since 0.1.0
    def list
      
    end

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

  end
end