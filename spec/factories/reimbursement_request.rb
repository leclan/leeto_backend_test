# frozen_string_literal: true

FactoryBot.define do
  factory :reimbursement_request do
    amount { 12.99 }
    perk { create(:perk) }
    employee { create(:employee) }
  end
end
