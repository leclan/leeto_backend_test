# frozen_string_literal: true

FactoryBot.define do
  factory :perk do
    name { 'Netflix' }
    maximum_amount { 12.99 }
    organisation { create :organisation }
    start_date { Time.current - 5.days }
    end_date { Time.current + 2.days }

    factory :previous_perk do
      start_date { Time.current - 5.days }
      end_date { Time.current - 10.minutes }
    end

    factory :future_perk do
      start_date { Time.current + 1.days }
      end_date { Time.current + 3.days }
    end
  end
end
