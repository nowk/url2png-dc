module Url2PngDc
  class Configuration
    URL2PNG_API_URL     = 'http://beta.url2png.com'
    URL2PNG_API_VERSION = 'v6'

    attr_accessor :url2png_apikey
    attr_accessor :url2png_secret
    attr_accessor :viewport_dimensions
    attr_accessor :fullpage
    attr_accessor :force_refresh

    def initialize
      @url2png_apikey      = 'PXXXX'
      @url2png_secret      = 'SXXXX'
      @viewport_dimensions = '1280x1024'
      @fullpage            = false
      @force_refresh       = false
    end

    def url2png_api_url
      URL2PNG_API_URL
    end

    def url2png_api_version
      URL2PNG_API_VERSION
    end
  end
end
