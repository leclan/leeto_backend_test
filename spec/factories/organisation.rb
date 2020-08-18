# frozen_string_literal: true

FactoryBot.define do
  factory :organisation do |org|
    org.name { generate :organisation_name }
  end
end
