require 'rubygems'
gem 'minitest'

$:.push File.expand_path("../../lib", __FILE__)
require 'url2png_dc'

require 'turn'
require 'minitest/autorun'

def json_payload
  # TODO pay attention to disclaimer
  # TODO sample data comes from: http://beta.url2png.com/v6/P4DE5D1C99D8EF/c9d1c2e545d1280fb6c249aed4031c4b/json/?url=twitter.github.com%2Fbootstrap&viewport=1024x1024&thumbnail_max_width=275
  <<-json
{"_disclaimer_":"This is a draft format is subject to change. Changes will be announced on twitter @url2png -- dan@url2png.com if you have suggestions or comments. Thanks!","status":"ok","job_id":"5ca8fac5a6c33f62bfb0f5d36a388e6219180414","request":{"submitted":"2012-08-31 21:18:52","viewport":"1024x1024","url":"http:\/\/twitter.github.com\/bootstrap","fullpage":false,"thumbnail_max_height":0,"thumbnail_max_width":275},"png":"http:\/\/cache-01.url2png.com\/P4DE5D1C99D8EF\/12244\/5ca8fac5a6c33f62bfb0f5d36a388e6219180414_1.png","meta":{"title":null,"dimensions_original":"1024x1976","dimensions_final":"1024x1976"},"headers":{"X-submitted":"1346447932","X-Original-Status":"HTTP\/1.1 301 Moved Permanently","Etag":"5ca8fac5a6c33f62bfb0f5d36a388e6219180414","X-Status":"OK"},"debug":["Curl Status is 0"]}
  json
end

def mock_my_httparty!(and_return_payload = json_payload)
  # mocky
  HTTParty.instance_eval do
    (class << self; self; end).__send__ :define_method, :get do |url|
      obj = Object.new
      (class << obj; self; end).__send__ :define_method, :body do
        and_return_payload
      end
      obj
    end
  end
end

class Sandbox
  include Url2PngDc::UrlHelpers
end
