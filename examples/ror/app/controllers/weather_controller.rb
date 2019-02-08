require 'apixu'

class WeatherController < ApplicationController
  def search
    client = Apixu::Client.new ENV['APIXUKEY']

    begin
      result = client.search params[:q]
    rescue Apixu::Errors::Request => e
      result = {error: e.message}
    end

    render json: result
  end
end
