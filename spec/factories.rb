FactoryBot.define do
  factory :employee do
    organisation { create(:organisation) }

    sequence(:email) { |n| "email#{n}@example.com"}
    password { "some_password" }
    first_name { "John" }
    last_name { "Doe" }
    seniority { 6 }
  end

  factory :organisation do
    sequence(:name) { |n| "Organisation #{n}" }
  end

  factory :perk do
    organisation { create(:organisation) }

    sequence(:name) { |n| "Perk #{n}" }
    period { 3 }
    maximum_amount { 15 }
  end

  factory :perk_rule do
    property { 'seniority' }
    operator { 'lt' }
    value { 6 }
  end

  factory :reimbursement_request do
    employee { nil }
    perk { nil }
    amount { 1 }
  end
end