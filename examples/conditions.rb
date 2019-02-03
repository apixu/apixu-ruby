require 'apixu'

client = Apixu::Client.new ENV["APIXUKEY"]

conditions = client.conditions

conditions.each { |condition| puts condition["code"], condition["icon"], "\n\n" }

=begin
[
    {
        "code" : 1000,
        "day" : "Sunny",
        "night" : "Clear",
        "icon" : 113
    }
]
*/
=end
