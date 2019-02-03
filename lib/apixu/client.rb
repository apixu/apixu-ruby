require 'apixu/errors'
require 'rest-client'
require 'json'

module Apixu
  class Client
    API_URL = "https://api.apixu.com"
    API_VERSION = "v1"
    FORMAT = "json"
    HTTP_TIMEOUT = 20
    DOC_WEATHER_CONDITIONS_URL = "https://www.apixu.com/doc/Apixu_weather_conditions"

    def initialize key
      @key = key

      unless ! @key.to_s.strip.empty?
        raise Errors::InvalidKey
      end
    end

    def conditions
      request "#{DOC_WEATHER_CONDITIONS_URL}.#{FORMAT}"
    end

    def current query
      request url(:current), q: query
    end

    def forecast query, days=1
      request url(:forecast), q: query, days: days
    end

    def history query, since
      if ! since.instance_of?(Date)
        raise ArgumentError.new("Param \"since\" must be a date")
      end

      request url(:history), q: query, dt: since.strftime("%Y-%m-%d")
    end

    def search query
      request url(:search), q: query
    end

    private def url endpoint
      "#{API_URL}/#{API_VERSION}/#{endpoint}.#{FORMAT}"
    end

    private def request url, params={}
      params["key"] = @key
      result = JSON::parse(RestClient::Request.execute(
          method: :get,
          url: url + '?' + URI.encode_www_form(params),
          params: params,
          timeout: HTTP_TIMEOUT
        )
      )

      if result.is_a?(Hash) && result["error"]
        raise Errors::Request.new(
          result["error"]["code"],
          result["error"]["message"]
        )
      end

      result
    end
  end
end
