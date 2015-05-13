$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH << File.join(File.dirname(__FILE__))

require 'rubygems'
require 'rspec'
require 'json'
require 'mocha/api'

require 'factory_girl'
require 'factory_json'

spec = Gem::Specification.find_by_name('factory_girl')
require File.join(spec.gem_dir, 'spec', 'support', 'shared_examples', 'strategy')

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_framework = :mocha

  config.after do
    FactoryGirl.reload
  end
end