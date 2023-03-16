# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { FFaker::Internet.email }
    email { FFaker::Name.name }
    birthdate { 21.years.ago }
  end
end
