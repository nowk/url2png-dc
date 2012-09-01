require 'test_helper'

module Url2PngDc
  class TestCache < MiniTest::Unit::TestCase
    def url_2json_url
      Sandbox.new.url_2json "http://google.com"
    end


    # This provides a solution to insert images properly for display on
    # Microsoft Outlook email clients
    #
    def test_url_to_return_cached_url
      mock_my_httparty!

      cache = Cache.new url_2json_url
      assert_match(/cache(-[\d]+)\.url2png\.com/, cache.url)
    end

    def test_url_returns_nil_if_png_key_is_empty_or_missing
      cache = Cache.new url_2json_url
      json  = JSON.parse(json_payload)

      json['png'] = ''
      mock_my_httparty! json.to_json
      assert_nil cache.url

      json.delete('png')
      mock_my_httparty! json.to_json
      assert_nil cache.url
    end

    def test_url_returns_nil_if_request_to_url2png_raises_anything
      # mocky
      HTTParty.instance_eval do
        def get(url)
          raise StandardError
        end
      end

      cache = Cache.new url_2json_url
      assert_nil cache.url
    end

    def test_url_returns_nil_if_json_parse_raises_json_parse_error
      mock_my_httparty! "this is not json..."

      cache = Cache.new url_2json_url
      assert_nil cache.url
    end
  end
end

