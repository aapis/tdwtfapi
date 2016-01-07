require 'net/http'

module TDWTF
  class Request
    class << self

      def get(url, args = [])
        url = URI(url)

        response = JSON.parse(Net::HTTP.get(url))

        symbolize_keys(response)
      end

      def post(url, args = [])
         url = URI(url)

        response = JSON.parse(Net::HTTP.post(url))

        symbolize_keys(response)
      end

      private

      def symbolize_keys(hash)
        hash.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
      end

    end
  end
end