require 'test_helper'

class TestUrl2PngDc < MiniTest::Unit::TestCase
  def teardown
    Url2PngDc.instance_eval do
      @_configuration = nil
    end
  end

  def test_overriding_configuration_defaults
    # must reset configuration on teardown, or it will act as configuration
    # for test suite
    #
    Url2PngDc.configure do |config|
      config.url2png_apikey      = 'abcdefg'
      config.url2png_secret      = 'hijklmn'
      config.viewport_dimensions = '1080x720'
      config.fullpage            = true
      config.force_refresh       = true
    end

    configuration = Url2PngDc.configuration

    assert_equal 'abcdefg',  configuration.url2png_apikey
    assert_equal 'hijklmn',  configuration.url2png_secret
    assert_equal '1080x720', configuration.viewport_dimensions
    assert_equal true,       configuration.fullpage
    assert_equal true,       configuration.force_refresh
  end

  def test_cant_override_api_url
    assert_raises NoMethodError do
      Url2PngDc.configure do |config|
        config.url2png_api_url = 'http://google.com'
      end
    end
  end

  def test_cant_override_api_version
    assert_raises NoMethodError do
      Url2PngDc.configure do |config|
        config.url2png_api_version = 'v3'
      end
    end
  end
end
