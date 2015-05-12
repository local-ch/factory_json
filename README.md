# FactoryJson

Hi! Main purpose of this gem is to provide a simple way to manipulate JSON data structures using power of
FactoryGirl gem.

## Installation

Add this line to your application's Gemfile:

    gem 'factory_json'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install factory_json

## Usage

This extension provides two cases. A hash that is being used as a class facory build class or any other build class

#### Dealing with Hashes

This is quite simple case. All you need to do is to specify a Hash as a build class while registering factory and thet is pretty much it

```ruby
# spec/factories/data_structures.rb
FactoryGirl.define do
  factory :entry_relation, class: 'Hash' do
    type "RELATED"
    label "Apartment:"
    name_summary "Mr Darth Vader"

    trait :with_address do
      street_summary "Tatooine"
      city_summary "Galactic Empire"
    end
  end
end
```

Now you can use this factory inside your tests

```ruby
entry_relation = FactoryGirl.as_json(:entry_relation, :with_address) # to return data as a Ruby hash, that beeing piped through JSON parse
entry_relation = FactoryGirl.json(:entry_relation, :with_address) # to return string, that contains valid JSON
``` 

#### Dealing with Models
  
This is a bit more complicated example, but still it is simple. Suppose there is an existing factory for an active record.
All you need to do is to define to_json or to_hash (since to_json is based on to_hash) methods on the model.

```ruby
# spec/factories/users.rb
FactoryGirl.define do
  factory :user, class: 'User' do
    name "User 1"
    email "test@example.com"

    trait :with_profile
      association :profile
    end
  end
end

# app/models/user.rb
class User < ActiveRecord::Base
  
  def to_hash
    {
      name: self.name,
      email: self.email,
      profile: profile.to_hash
    }
  end
end
```

Now you can use this factory inside your tests

```ruby
user = FactoryGirl.build(:user, :with_profile) # to return new User object
user = FactoryGirl.create(:user, :with_profile) # to return persistent User object
user_hash = FactoryGirl.as_json(:user, :with_profile) # to return data as a Ruby hash, that beeing piped through JSON parse
user_json = FactoryGirl.json(:user, :with_profile) # to return string, that contains valid JSON
``` 

## Contributing

1. Fork it ( https://github.com/[my-github-username]/factory_json/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
