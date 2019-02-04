require 'bundler/setup'
require 'apixu'

client = Apixu::Client.new ENV['APIXUKEY']

search = client.search 'London'

search.each do |location|
  puts location['id'], location['name'], location['region'], "\n"
end

=begin
[
   {
      "id":2801268,
      "name":"London, City of London, Greater London, United Kingdom",
      "region":"City of London, Greater London",
      "country":"United Kingdom",
      "lat":51.52,
      "lon":-0.11,
      "url":"london-city-of-london-greater-london-united-kingdom"
   }
]
=end
