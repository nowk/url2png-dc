require 'test_helper'

class TestReallyMakeCallToUrl2Png < MiniTest::Unit::TestCase
  def teardown
    Url2PngDc.instance_eval do
      @_configuration = nil
    end
  end

  def test_retrieving_an_actual_cache_url
    Url2PngDc.configure do |config|
      config.url2png_apikey = ENV['URL2PNG_APIKEY']
      config.url2png_secret = ENV['URL2PNG_SECRET']
    end

    url = Sandbox.new.url_2cache "http://google.com"
    assert_match /cache(-[\d]+)\.url2png\.com/, url
  end
end
