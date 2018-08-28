require 'ffaker'

FactoryBot.define do
  factory :user do
    user_name  { FFaker::Name.first_name }
    password   { Devise.friendly_token(20) }
    full_name  { FFaker::Name.name }
  end
end