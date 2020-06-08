# frozen_string_literal: true

FactoryBot.define do
  factory :session do
    association :mentor
    association :mentee
    description { Faker::Lorem.sentence }
    status { :pending }
    date { Faker::Time.forward(days: 30, period: :morning) }
  end
end
