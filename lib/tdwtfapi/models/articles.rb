module TDWTF
  class Articles < EndpointResource
    
    ENDPOINT_PREFIX = :articles

    def article(id)
      request("#{ENDPOINT_PREFIX}/id/#{id}")
    end

  end
end