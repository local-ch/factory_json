$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH << File.join(File.dirname(__FILE__))

require 'rubygems'
require 'rspec'
require 'rspec/autorun'

require 'mocha/api'
require 'bourne'
require 'timecop'

require 'factory_bot'
require 'factory_json'

source_path = Gem::Specification.find_by_name('factory_bot').gem_dir

files = File.join(source_path, 'spec', 'support', 'macros', '**', '*.rb')
Dir[files].each { |f| require File.expand_path(f) }

files = File.join(source_path, 'spec', 'support', 'matchers', '**', '*.rb')
Dir[files].each { |f| require File.expand_path(f) }

require "support/shared_examples/strategy"

RSpec.configure do |config|
  config.mock_framework = :mocha
  config.include DeclarationMatchers

  config.after do
    Timecop.return
    FactoryBot.reload
  end
end
