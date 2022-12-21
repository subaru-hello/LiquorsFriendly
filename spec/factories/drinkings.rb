# frozen_string_literal: true

FactoryBot.define do
  factory :drinking do
    name { '三茶で飲み会' }
    starts_at { Time.now }
  end
end
