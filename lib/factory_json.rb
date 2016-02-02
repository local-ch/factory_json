require 'json'
require "factory_girl"

require "factory_json/version"

require "factory_girl/strategy/json"
require "factory_girl/strategy/as_json"
require "factory_girl/attribute_assigner_with_hash_support"

FactoryGirl.register_strategy(:json, FactoryGirl::Strategy::JSON)
FactoryGirl.register_strategy(:as_json, FactoryGirl::Strategy::AsJSON)

FactoryGirl::AttributeAssigner.prepend FactoryGirl::AttributeAssignerWithHashSupport
