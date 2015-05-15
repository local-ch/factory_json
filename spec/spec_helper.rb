$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH << File.join(File.dirname(__FILE__))

require 'rubygems'
require 'rspec'
require 'rspec/autorun'
require 'mocha/api'
require 'bourne'

require 'factory_girl'
require 'factory_json'

spec = Gem::Specification.find_by_name('factory_girl')

files = File.join(spec.gem_dir, 'spec', 'support', 'macros', '**', '*.rb')
Dir[files].each { |f| require File.expand_path(f) }

files = File.join(spec.gem_dir, 'spec', 'support', 'matchers', '**', '*.rb')
Dir[files].each { |f| require File.expand_path(f) }

require "support/shared_examples/strategy"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_framework = :mocha
  config.include DeclarationMatchers

  config.after do
    FactoryGirl.reload
  end
end