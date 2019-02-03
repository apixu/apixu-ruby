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

  it 'supports for conditions list' do
    result = env_client.conditions
    expect(result).to match_json_schema("conditions")
  end

  it 'supports for querying current weather' do
    result = env_client.current "Paris"
    expect(result).to match_json_schema("current")
  end

  it 'supports for weather forecasts' do
    result = env_client.forecast "Paris", days=3
    expect(result).to match_json_schema("forecast")
  end

  it 'supports for weather history' do
    result = env_client.history "Paris", since=Date.today()
    expect(result).to match_json_schema("history")
  end

  it 'supports for weather history error' do
    expect {
      env_client.history "Paris", since=""
    } .to raise_error(ArgumentError)
  end

  it 'supports for search' do
    result = env_client.search "London"
    expect(result).to match_json_schema("search")
  end
end
