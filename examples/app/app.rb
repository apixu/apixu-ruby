require 'bundler/setup'
require 'dotenv'
require 'apixu'

Dotenv.overload

client = Apixu::Client.new ENV['APIXUKEY']
result = client.search 'London'
puts result
