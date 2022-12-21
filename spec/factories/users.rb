# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test_#{n}@example.com" }
    password { 'password' }
  end

  trait :admin do
    role { 'admin' }
  end
end
