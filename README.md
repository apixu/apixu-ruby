# Apixu Ruby

Ruby library for [Apixu Weather API](https://www.apixu.com/api.aspx)

## Requirements
* [Ruby](https://www.ruby-lang.org/en/downloads/)
* [Bundler](https://bundler.io/)
* [Git](https://git-scm.com/downloads) (optional)

## Install Apixu client

Choose the version you want to install from the [releases page](https://github.com/apixu/apixu-ruby/releases)
or choose `master` to install the latest updates.

#### Gemfile

Add to your Gemfile:
```
gem 'apixu', git: 'https://github.com/apixu/apixu-ruby.git', tag: 'vX.X.X'
```
or
```
gem 'apixu', git: 'https://github.com/apixu/apixu-ruby.git', branch: 'master'
```

Then run:
```
bundle install
```

Add this to your app (required because the library is installed directly from Github):
```
require 'bundler/setup'
```

#### Manually
```
wget https://github.com/apixu/apixu-ruby/archive/vX.X.X.tar.gz # or master.tar.gz
tar -xzf vX.X.X.tar.gz
```

Add to your Gemfile:
```
gem 'apixu', path: '/path/to/apixu-ruby-X.X.X'
```

Then run:
```
bundle install
```

Add this to your app (required because the library is installed from local path):
```
require 'bundler/setup'
```

## Usage

See the [examples](./examples).

```
APIXUKEY=yourapikey ruby examples/<file>.rb
```

## Documentation

https://www.apixu.com/doc/

## Development

#### Directly on your machine

After checking out the repo, run `bin/setup` to install dependencies. Then, to
test, run:

    APIXUKEY=yourapikey rake

You can also run `bin/console` for an interactive prompt that will allow you to
experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

#### With Docker

See [Makefile](Makefile).

Run tests:
```
make test RUBYVERSION=2 APIXUKEY=yourapikey
```

Enter environment:
```
make env RUBYVERSION=2 APIXUKEY=yourapikey
```

Run example file:
```
make run RUBYVERSION=2 APIXUKEY=yourapikey FILE=examples/search.rb
```
