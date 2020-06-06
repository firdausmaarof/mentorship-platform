# frozen_string_literal: true

FactoryBot.define do
  factory :mentee do
    name { Faker::Name.name }
    email { 'foo@bar.com' }
    password { 'foobar' }
  end
end
