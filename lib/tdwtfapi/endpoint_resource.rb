module TDWTF
  class EndpointResource

    #
    # since 0.1.0
    def request(url)
      raise ArgumentError, "URL is a required to send a request" if url.nil?

      uri = "#{TDWTF.base_url}#{url}"

      Request.get(uri)
    end

  end
end