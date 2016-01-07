require 'net/http'
require 'tdwtfapi/response'

module TDWTF
  class Request
    class << self

      #
      # since 0.1.0
      def get(url, args = [])
        url = URI(url)

        response = JSON.parse(Net::HTTP.get(url))

        Response.new(response)
      end

    end
  end
end