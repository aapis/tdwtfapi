require 'json'

require 'tdwtfapi/version'
require 'tdwtfapi/exceptions'

require 'tdwtfapi/request'
require 'tdwtfapi/endpoint_resource'

require 'tdwtfapi/models/articles'
require 'tdwtfapi/models/author'
require 'tdwtfapi/models/series'

module TDWTF

  #
  # since 0.1.0
  def self.base_url
    'http://thedailywtf.com/api/'
  end

end
