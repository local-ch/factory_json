require 'json'
require "factory_bot"

require "factory_json/version"

require "factory_bot/strategy/json"
require "factory_bot/strategy/as_json"
require "factory_bot/attribute_assigner_with_hash_support"

FactoryBot.register_strategy(:json, FactoryBot::Strategy::JSON)
FactoryBot.register_strategy(:as_json, FactoryBot::Strategy::AsJSON)

FactoryBot::AttributeAssigner.prepend FactoryBot::AttributeAssignerWithHashSupport
