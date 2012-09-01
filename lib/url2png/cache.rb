module Url2PngDc
  # TODO Rename this, "Cache" sounds a bit misleading in this context
  #
  class Cache
    def initialize(json_payload)
      @payload = json_payload
    end

    def url
      parse_out_cache_url_from_payload
    end


  private

    def parse_out_cache_url_from_payload
      _json = JSON.parse(@payload)
      _png = _json['png']
      _png if _png && !_png.empty?
    end
  end
end
