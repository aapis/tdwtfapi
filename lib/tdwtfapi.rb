require 'json'

require 'tdwtfapi/version'

require 'tdwtfapi/request'
require 'tdwtfapi/endpoint_resource'

require 'tdwtfapi/models/articles'
require 'tdwtfapi/models/author'
require 'tdwtfapi/models/series'

module TDWTF
  def self.base_url
    'http://thedailywtf.com/api/'
  end
end
