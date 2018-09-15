require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    username 'username'
  end

  factory :group do
    name 'name'
    owner_id 'owner_id'
  end

  factory :army do
    name 'name'
  end

  factory :membership do
    user_id 'user_id'
    army_id 'army_id'
    group_id 'group_id'
  end
end
