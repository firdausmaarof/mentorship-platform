# frozen_string_literal: true

FactoryBot.define do
  factory :mentor do
    name { Faker::Name.name }
    email { 'foo@bar.com' }
    password { 'foobar' }
    about { Faker::Lorem.sentence }
  end
end
