# frozen_string_literal: true

FactoryBot.define do
  factory :liquor do
    email { 'test@example.com' }
    password { 'password' }
  end
end
