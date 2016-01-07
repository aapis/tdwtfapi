require 'date'

module TDWTF
  class Response

    attr_accessor :raw, :body, :summary, :title, :author, :date, :id, :related, :series

    def initialize(http_resp)
      raw = recursive_symbolize_keys(http_resp)
      
      @id = raw[:id]
      @body = raw[:bodyhtml]
      @summary = raw[:summaryhtml]
      @title = raw[:title]
      @author = raw[:author]
      @date = DateTime::parse(raw[:publisheddate])
      @series = raw[:series][:title]
      @related = {
        next: {
          title: raw[:nextarticletitle],
          url: raw[:nextarticleurl]
        },
        previous: {
          title: raw[:previousarticletitle],
          url: raw[:previousarticleurl]
        }
      }
    end

    private

    # Thanks SO - http://stackoverflow.com/a/10721936
    # since 0.1.0
    def recursive_symbolize_keys(h)
      case h
      when Hash
        Hash[
          h.map do |k, v|
            [ k.respond_to?(:to_sym) ? k.downcase.to_sym : k.downcase, recursive_symbolize_keys(v) ]
          end
        ]
      when Enumerable
        h.map { |v| recursive_symbolize_keys(v) }
      else
        h
      end
    end

  end
end