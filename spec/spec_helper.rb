$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'apixu'
require 'byebug'
require 'rspec/expectations'
require 'json-schema'

RSpec::Matchers.define :match_json_schema do |expected|
  match do |actual|
    JSON::Validator.validate(File.dirname(__FILE__) + '/schema/' + expected + '.json', actual)
  end
end
