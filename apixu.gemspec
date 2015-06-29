# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'apixu/version'

Gem::Specification.new do |spec|
  spec.name          = "apixu"
  spec.version       = Apixu::VERSION
  spec.authors       = ["Rohan Jain"]
  spec.email         = ["crodjer@gmail.com"]

  spec.summary       = %q{Ruby library for Apixu Weather API}
  spec.description   = %q{Ruby library for Apixu Weather API}
  spec.homepage      = "http://www.apixu.com/"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "byebug"
end
