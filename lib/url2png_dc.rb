require 'digest'
require 'cgi'
require 'json'
require 'httparty'

require 'url2png/configuration'
require 'url2png/url_helper'
require 'url2png/cache'

module Url2PngDc
  include HTTParty

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

# TODO replace this, we need to deploy fast at the moment
ActionView::Base.send(:include, Url2PngDc::UrlHelpers) if defined? ActionView
