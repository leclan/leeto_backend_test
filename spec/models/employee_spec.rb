require 'rails_helper'

RSpec.describe Employee, type: :model do
  subject { create(:employee) }

  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :email }

  describe '#seniority_in_months' do
    let(:employee) { create(:employee, hire_date: Date.current - 125.days) }

    subject { employee.seniority_in_months }

    it { is_expected.to eq 4 }
  end
end
