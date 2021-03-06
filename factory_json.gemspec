lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'factory_json/version'

Gem::Specification.new do |spec|
  spec.name          = "factory_json"
  spec.version       = FactoryJson::VERSION
  spec.authors       = ["E-Max"]
  spec.email         = ["max.zab87@gmail.com"]
  spec.summary       = %q{FactoryBot's extension for JSON support.}
  spec.description   = %q{FactoryBot can now handle JSON representation for an object.}
  spec.homepage      = "https://github.com/local-ch/factory_json"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 2.3'

  spec.add_dependency "factory_bot"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "cucumber", "~> 1.3.15"
  spec.add_development_dependency "rspec", "~> 3.3.0"
  spec.add_development_dependency "aruba"
  spec.add_development_dependency "bourne"
  spec.add_development_dependency "mocha", ">= 0.12.8"
  spec.add_development_dependency "appraisal", "~> 1.0.0"
  spec.add_development_dependency "activerecord", ">= 3.0.0"
  spec.add_development_dependency "timecop"

  # Compatibility test
  spec.add_development_dependency "factory_bot_rails"
  spec.add_development_dependency 'geminabox'
  spec.add_development_dependency 'rubocop', '~> 0.57.1'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.26.0'
end
