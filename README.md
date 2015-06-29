# Apixu

This is the client library for apixu's weather api.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apixu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install apixu

## Usage


```ruby
> require 'apixu'
> client = Apixu::Client.new "<APIXU KEY>"
> client.current "Paris"
{ "current" => <...>, "location" => <...> }
> client.forecast "Paris", days=3 # days is an optional parameter.
{ "current" => <...>, "forecast" => <...>, "location" => <...>}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, to
test, run:

    TEST_APIXU_KEY=<YOUR APIXU KEY> rake

You can also run `bin/console` for an interactive prompt that will allow you to
experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Tests

The output for a successful test run would look something like this:

    $ rake
    Apixu::Client
      has a version number
      allows creating new clients
      stores API key
      supports API key environment variable
      does not allow overriding key
      constructs urls
      supports for querying current weather
      supports for weather forecasts

    Finished in 9.09 seconds (files took 0.61258 seconds to load)
    8 examples, 0 failures
