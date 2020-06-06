# frozen_string_literal: true

FactoryBot.define do
  factory :mentor do
    name { Faker::Name.name }
    email { 'foo@bar.com' }
    password { 'foobar' }
  end
end
