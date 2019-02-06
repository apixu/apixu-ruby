require 'bundler/setup' # required because Apixu is installed directly from Github
require 'dotenv'
require 'apixu'

Dotenv.overload

client = Apixu::Client.new ENV['APIXUKEY']
result = client.search 'London'
puts result
