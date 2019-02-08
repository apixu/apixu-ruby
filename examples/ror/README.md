# APP

## Ruby on Rails app using Apixu

### Requirements
* Ruby
* [Ruby on Rails](https://rubyonrails.org/)
* Git

### Setup app

Set APIXUKEY in the .env file.
```
cp .env.dist .env
```

Set Apixu library dependency in [Gemfile](./Gemfile).

### Install packages
```
bundle install
```

### Run app
```
rails s
```

### Test
```
curl 127.0.0.1:3000/weather/search?q=Paris
```
