require 'apixu/errors'
require 'rest-client'
require 'json'

module Apixu
  class Client
    attr_reader :key

    BASE_URL = "http://api.apixu.com/v1"

    def initialize key=nil
      @key = key || ENV["APIXU_KEY"]

      unless @key
        raise Errors::InvalidKey
      end
    end

    def url endpoint
      "#{BASE_URL}/#{endpoint}.json"
    end

    def request key, params={}
      params["key"] = @key
      result = JSON::parse(RestClient.get url(key), params: params)

      if result["error"]
        raise Errors::Request.new(result["error"]["code"],
                                  result["error"]["message"])
      else
        result
      end
    end

    def current query
      request :current, q: query
    end

    def forecast query, days=1
      request :forecast, q: query, days: days
    end
  end
end
