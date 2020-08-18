# frozen_string_literal: true

FactoryBot.define do
  factory :perk do |p|
    p.name { 'Netflix' }
    p.maximum_amount { 12.99 }
    p.organisation { create :organisation }
  end
end
