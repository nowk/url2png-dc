module Url2PngDc
  module UrlHelpers
    def self.included(base)
      base.class_eval do
        include InstanceMethods
      end
    end

    module InstanceMethods
      def url_2png(url, options = {})
        url_builder(query_string_builder(url, options))
      end

      def url_2json(url, options = {})
        url_builder(query_string_builder(url, options), :json)
      end


    private

      def url2png_conf
        Url2PngDc.configuration
      end

      def url_builder(query_string, url2png_api_format = :png)
        File.join(
          url2png_conf.url2png_api_url,
          url2png_conf.url2png_api_version,
          url2png_conf.url2png_apikey,
          generate_url2png_token(query_string),
          url2png_api_format.to_s,
          "?#{query_string}"
        )
      end

      def query_string_builder(url, options = {})
        params = {
          :url                  => url,

          :force                => 
            int_my_bool(options[:force] || url2png_conf.force_refresh),
          :fullpage             => 
            int_my_bool(options[:fullpage] || url2png_conf.fullpage),

          :thumbnail_max_width  => options[:thumbnail_max_width],
          :thumbnail_max_height => options[:thumbnail_max_height],

          :viewport             => 
            options[:viewport] || url2png_conf.viewport_dimensions
        }

        params.sort_by { |o| o[0] }.inject([]) { |memo, obj|
          k, v = *obj.map(&:to_s)
          memo << [CGI.escape(k), CGI.escape(v)].join("=") if v && !v.empty?
          memo
        }.join("&")
      end

      def generate_url2png_token(query_string)
        raise ArgumentError, "Query string can't be blank" unless 
          query_string && !query_string.empty?

        Digest::MD5.hexdigest(query_string+url2png_conf.url2png_secret)
      end


      def int_my_bool(val)
        return val if val.is_a?(Fixnum)
        val === true ? 1 : 0
      end
    end
  end
end
