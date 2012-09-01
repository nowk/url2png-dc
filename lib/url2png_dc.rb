require 'digest'
require 'cgi'

require 'url2png/configuration'
require 'url2png/url_helper'

module Url2PngDc
  class << self
    def configuration
      @_configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
      configuration
    end
  end
end

