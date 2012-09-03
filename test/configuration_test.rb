require 'test_helper'

module Url2PngDc
  class TestConfiguration < MiniTest::Unit::TestCase
    def test_configuration_defaults
      configuration = Configuration.new

      assert_equal 'PXXXX',                  configuration.url2png_apikey
      assert_equal 'SXXXX',                  configuration.url2png_secret
      assert_equal 'http://api.url2png.com', configuration.url2png_api_url
      assert_equal 'v6',                     configuration.url2png_api_version

      assert_equal '1280x1024',              configuration.viewport_dimensions
      assert_equal false,                    configuration.fullpage
      assert_equal false,                    configuration.force_refresh
    end
  end
end

