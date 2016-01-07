require 'net/http'
require 'tdwtfapi/response'

module TDWTF
  class Request
    class << self

      def get(url, args = [])
        url = URI(url)

        response = JSON.parse(Net::HTTP.get(url))

        Response.new(response)
      end

    end
  end
end