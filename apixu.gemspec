# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'apixu/version'

Gem::Specification.new do |spec|
  spec.name          = 'apixu'
  spec.version       = Apixu::VERSION
  spec.authors       = ['Rohan Jain', 'Andrei Avram']
  spec.email         = ['crodjer@gmail.com', 'avramandrei@ymail.com']

  spec.summary       = 'Ruby library for Apixu Weather API'
  spec.description   = 'Real-time, future and historical weather.'
  spec.homepage      = 'https://www.apixu.com/'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client', '~> 2.0'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'json-schema', '~> 2.8'
  spec.add_development_dependency 'rubocop', '~> 0.63'
end
