require 'bundler/setup'
require 'apixu'

begin
  Apixu::Client.new ''
rescue Apixu::Errors::InvalidKey
  puts 'No API key'
end

client = Apixu::Client.new ENV['APIXUKEY']

begin
  client.search ''
rescue Apixu::Errors::Request => e
  puts e
end

begin
  c = Apixu::Client.new 'invalid key'
  c.search ''
rescue Apixu::Errors::Request => e
  puts e
end

begin
  client = Apixu::Client.new ENV['APIXUKEY']
  client.current ' '
rescue Apixu::Errors::Request => e
  puts 'Nothing found' if e.code == Apixu::Errors::NO_LOCATION_FOUND_FOR_QUERY
end

begin
  client.history '', ''
rescue ArgumentError => e
  puts e
end
