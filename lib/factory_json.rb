require "factory_json/version"

require "factory_girl/strategy/json"
require "factory_girl/strategy/as_json"

FactoryGirl.register_strategy(:json,  FactoryGirl::Strategy::JSON)
FactoryGirl.register_strategy(:as_json,  FactoryGirl::Strategy::AsJSON)
