module Url2PngDc
  # TODO Rename this, "Cache" sounds a bit misleading in this context
  #
  class Cache
    def initialize(url_2json_url)
      @url_2json_url = url_2json_url
    end

    def url
      parse_out_cache_url_from_payload
    end


  private

    def parse_out_cache_url_from_payload
      return nil if (payload = request_to_url2png).nil?

      _json = JSON.parse(payload)
      _png = _json['png']
      _png if _png && !_png.empty?
    rescue
      nil
    end

    def request_to_url2png
      response = ::HTTParty.get(@url_2json_url)
      response.body
    end
  end
end
