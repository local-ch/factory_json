# DEPRECATED
This gem is deprecated please do NOT use it for new projects.

# FactoryJson

Hi! The main purpose of this gem is to provide a simple way to create JSON data structures using the power of
FactoryBot's DSL.

## Installation

Add this line to your application's Gemfile:

    gem 'factory_json'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install factory_json

## Usage

This extension provides two new ways of working with FactoryBot

#### Dealing with Hashes

Tired of creating json fixtures somewhere in your app and keeping them up to date alongside with your factories? Now you can create your JSON fixtures with factories: All you need to do is specify a Hash as the build class while registering the factory ... and that is pretty much it!

```ruby
# spec/factories/data_structures.rb
FactoryBot.define do
  factory :entry, class: Hash do
    name "This one is special"
    location "The place where you can always see a Sunrise"

    after(:build) do |entry|
      entry[:relations] = FactoryBot.build_list(entry_relation, 3, :with_address)
    end
  end

  factory :entry_relation, class: Hash do
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

And this might be a way to use these in our specs

```ruby
entry_relation = FactoryBot.as_json(:entry_relation, :with_address) # to return data as a Ruby hash, that beeing piped through JSON parse
entry_relation = FactoryBot.json(:entry_relation, :with_address) # to return string, that contains valid JSON
```

#### Dealing with Models


You have a factory that you'd also like to use as a JSON fixture? Use common usage patterns (to_json) with our fixtures now! Not only can you get JSON from your factories, but of course also Hashes. All you need to do is to define to_json or to_hash (since to_json is based on to_hash) on your model.

```ruby
# app/models.rb
class User

  has_one :profile

  def to_hash
    {
      name: self.name,
      email: self.email,
      profile: profile.to_hash
    }
  end

  def to_json(*args)
    to_hash.to_json(*args)
  end
end

class Profile

  belongs_to :user

  def to_hash
    {
      age: self.age,
      hair_color: self.hair_color,
      child_dream: self.child_dream,
      i_will_start_running: "tomorrow"
    }
  end

  def to_json(*args)
    to_hash.to_json(*args)
  end
end

# spec/factories.rb
FactoryBot.define do
  factory :user do
    name "User 1"
    email "test@example.com"

    trait :with_profile
      association :profile
    end
  end

  factory :profile do
    age "18 years"
    hair_color "blue"
    child_dream "To become a Jedi Knight"
  end
end
```


```ruby
user = FactoryBot.build(:user, :with_profile) # to return new User object
user = FactoryBot.create(:user, :with_profile) # to return persistent User object
user_hash = FactoryBot.as_json(:user, :with_profile) # to return data as a Ruby hash, that beeing piped through JSON parse
user_json = FactoryBot.json(:user, :with_profile) # to return string, that contains valid JSON
```

## Testing

Testing is pretty much standard

```bash
rspec spec
```

Testing compatibility with FactoryBot

```bash
rspec `bundle show factory_girl`/spec
```

## Contributing

1. Fork it ( https://github.com/local-ch/factory_json/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
