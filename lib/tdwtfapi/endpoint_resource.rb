module TDWTF
  class EndpointResource

    def request(url)
      raise ArgumentError, "URL is a required to send a request" if url.nil?

      uri = "#{TDWTF.base_url}#{url}"

      Request.get(uri)
    end

  end
end