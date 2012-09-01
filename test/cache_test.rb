require 'test_helper'

module Url2PngDc
  class TestCache < MiniTest::Unit::TestCase
    # This provides a solution to insert images properly for display on
    # Microsoft Outlook email clients
    #
    def test_url_to_return_cached_url
      cache = Cache.new json_payload
      assert_match /cache(-[\d]+)\.url2png\.com/, cache.url
    end

    def test_url_returns_nil_if_png_key_is_empty_or_missing
      json = JSON.parse(json_payload)
      json['png'] = ''
      cache = Cache.new json.to_json
      assert_nil cache.url

      json.delete('png')
      cache = Cache.new json.to_json
      assert_nil cache.url
    end

    def test_test_url_returns_nil_if_request_to_url2png_is_not_successful
      flunk "We need to test this"
    end
  end
end

