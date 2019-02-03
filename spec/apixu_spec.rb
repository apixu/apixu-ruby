require 'spec_helper'

describe Apixu::Client do
  def env_client
    Apixu::Client.new ENV["TEST_APIXU_KEY"]
  end

  it 'has a version number' do
    expect(Apixu::VERSION).not_to be nil
  end

  it 'allows creating new clients' do
    expect(Apixu::Client.new "key").to be_an_instance_of(Apixu::Client)
  end

  it 'stores API key' do
    api_key = "dummy key"
    client = Apixu::Client.new api_key
    expect(client.key).to eq(api_key)
  end

  it 'supports API key environment variable' do
    api_key = "dummy key"
    old_key = ENV["APIXU_KEY"]
    ENV["APIXU_KEY"] = api_key
    client = Apixu::Client.new
    ENV["APIXU_KEY"] = old_key
    expect(client.key).to eq(api_key)
  end

  it 'does not allow overriding key' do
    client = Apixu::Client.new "dummy key"
    expect do
      client.key = "another key"
    end.to raise_error(NameError)
  end

  it 'constructs urls' do
    url = "https://api.apixu.com/v1/test.json"
    expect(env_client.url :test).to eq(url)
  end

  it 'supports for querying current weather' do
    result = env_client.current "Paris"
    expect(result).to include("current")
    expect(result).to include("location")
  end

  it 'supports for weather forecasts' do
    result = env_client.forecast "Paris", days=3

    expect(result).to include("location")
    expect(result).to include("forecast")

    expect(result["forecast"]["forecastday"].length).to eq(3)
  end

  it 'supports for conditions list' do
    result = env_client.conditions

    expect(result.length).to be > 0
  end
end
