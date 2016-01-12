require 'date'

module TDWTF
  class Response

    attr_accessor :raw, :body, :summary, :title, :author, :date, :id, :related, :series, :results

    #
    # since 0.1.0
    def initialize(http_resp)
      raw = recursive_symbolize_keys(http_resp)

      raise APIException, "#{raw[:status]}" if has_error(raw[:status])

      if(raw.is_a?(Array))
        multiple(raw)
      else
        single(raw)
      end

    end

    private

    #
    # since 0.1.0
    def single(raw)
      raise APIException, "#{raw[:status]}" if msg_to_code(raw[:status]) == 500

      @id = raw[:id]
      @body = convert_line_endings(raw[:bodyhtml])
      @summary = raw[:summaryhtml]
      @title = raw[:title]
      @author = raw[:author]
      @date = DateTime::parse(raw[:publisheddate])
      @series = raw[:series][:title]
      @related = {
        next: {
          title: raw[:nextarticletitle],
          url: raw[:nextarticleurl],
          id: raw[:nextarticleid]
        },
        previous: {
          title: raw[:previousarticletitle],
          url: raw[:previousarticleurl],
          id: raw[:previousarticleid]
        }
      }
    end

    #
    # since 0.1.0
    def multiple(raw)
      @results = raw.each do |obj|
        # perform the necessary data corrections
        obj[:descriptionhtml] = convert_line_endings(obj[:descriptionhtml]) if obj[:descriptionhtml]
        obj[:bodyhtml] = convert_line_endings(obj[:bodyhtml]) if obj[:bodyhtml]
        obj[:publisheddate] = DateTime::parse(obj[:publisheddate])
        obj[:series] = obj[:series][:title]
      end
    end

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

    #
    # since 0.1.0
    def convert_line_endings(str)
      str.gsub(/\r\n/, '<br />')
    end

    #
    # since 0.1.0
    def has_error(message)
      [
        'Invalid Author',
        'Invalid Series','Invalid Id',
        'Invalid Article Slug',
        'JSON Serialization Error : ',
        'No articles found for the current date range or Invalid Series',
        'Count cannot be greater than 100',
        'Service Unavailable'
      ].include?(message)
    end

  end
end