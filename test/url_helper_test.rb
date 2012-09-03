require 'test_helper'

module Url2PngDc
  class TestUrlHelper < MiniTest::Unit::TestCase
    def url2png_apikey
      Url2PngDc.configuration.url2png_apikey
    end

    def a_url
      "http://google.com/maps/"
    end

    def query_string_with_defaults
      "force=0&fullpage=0&url=#{CGI.escape(a_url)}&viewport=1280x1024"
    end

    def token(query_string)
      Digest::MD5.hexdigest(query_string+Url2PngDc.configuration.url2png_secret)
    end


    def test_url_2png_generates_valid_url2png_url_for_png
      token = token(query_string_with_defaults)
      url   = Sandbox.new.url_2png a_url

      assert_equal "http://api.url2png.com/v6/#{url2png_apikey}/#{token}/png/?#{query_string_with_defaults}", url
    end

    def test_url_2png_generates_valid_url2png_url_for_png_with_options
      query_string_with_options = 
        "force=0&fullpage=1&url=#{CGI.escape(a_url)}&viewport=720x480"
      token = token(query_string_with_options)
      url   = Sandbox.new.url_2png a_url, {:fullpage => true, :viewport => '720x480'}

      assert_equal "http://api.url2png.com/v6/#{url2png_apikey}/#{token}/png/?#{query_string_with_options}", url
    end


    def test_url_2json_generates_valid_url2png_url_for_json
      token = token(query_string_with_defaults)
      url   = Sandbox.new.url_2json a_url

      assert_equal "http://api.url2png.com/v6/#{url2png_apikey}/#{token}/json/?#{query_string_with_defaults}", url
    end

    def test_url_2json_generates_valid_url2png_url_for_json_with_options
      query_string_with_options = 
        "force=0&fullpage=1&url=#{CGI.escape(a_url)}&viewport=1080x720"
      token = token(query_string_with_options)
      url   = Sandbox.new.url_2json a_url, {:fullpage => true, :viewport => '1080x720'}

      assert_equal "http://api.url2png.com/v6/#{url2png_apikey}/#{token}/json/?#{query_string_with_options}", url
    end


    def test_url_2cache_returns_a_url2png_cache_url
      mock_my_httparty!

      token = token(query_string_with_defaults)
      url   = Sandbox.new.url_2cache a_url
      assert_match(/cache(-[\d]+)\.url2png\.com/, url)
    end

    def test_url_2cache_resolves_to_url_2png_if_cache_url_is_empty_or_nil
      mock_my_httparty!

      # mocky
      Url2PngDc::Cache.class_eval do
        alias_method :url_original, :url
        def url
          nil
        end
      end

      resolved_url = Sandbox.new.url_2png a_url
      url          = Sandbox.new.url_2cache a_url

      assert_match resolved_url, url

      # put things back as they were
      Url2PngDc::Cache.class_eval do
        alias_method :url, :url_original
      end
    end


    def test_query_string_builder_builds_query_string_with_configuration
      query_string = Sandbox.new.__send__ :query_string_builder, a_url
      assert_equal query_string_with_defaults, query_string
    end

    def test_query_string_builder_builds_query_string_override_params
      expected_query_string = 
        "force=1&fullpage=1&thumbnail_max_height=300&thumbnail_max_width=400&url=#{CGI.escape(a_url)}&viewport=1080x720"

      query_string = Sandbox.new.__send__ :query_string_builder, a_url, {
        :force                => true,
        :fullpage             => true,
        :thumbnail_max_height => '300',
        :thumbnail_max_width  => '400',
        :viewport             => '1080x720'
        }
      assert_equal expected_query_string, query_string
    end

    def test_query_string_builder_ignores_non_related_options
      query_string = Sandbox.new.__send__ :query_string_builder, a_url, {
        :not_used_or_need_by_url2png => true
        }
      assert_equal query_string_with_defaults, query_string
    end

    def test_generate_url2png_token_generates_md5_token
      expected_token = token(query_string_with_defaults)
      query_string   = Sandbox.new.__send__ :query_string_builder, a_url
      token          = Sandbox.new.__send__ :generate_url2png_token, query_string

      assert_equal expected_token, token
    end

    def test_generate_url2png_token_must_have_query_string
      assert_raises ArgumentError do
        Sandbox.new.__send__ :generate_url2png_token, ''
      end
    end
  end
end

