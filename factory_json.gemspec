# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'factory_json/version'

Gem::Specification.new do |spec|
  spec.name          = "factory_json"
  spec.version       = FactoryJson::VERSION
  spec.authors       = ["E-Max"]
  spec.email         = ["max.zab87@gmail.com"]
  spec.summary       = %q{FactoryGirl's extension for JSON support.}
  spec.description   = %q{FactoryGirl can now handle JSON representation for an object.}
  spec.homepage      = "https://github.com/local-ch/factory_json"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 2.0'
  
  spec.add_dependency "factory_girl"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "mocha", "~> 0.14.0"
  spec.add_development_dependency "bourne"

  spec.add_development_dependency "activerecord", ">= 3.0.0"
end
