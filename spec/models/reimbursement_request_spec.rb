# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReimbursementRequest, type: :model do
  describe 'validations' do
    subject { create(:reimbursement_request) }

    it { is_expected.to validate_presence_of :amount }
    it { is_expected.to validate_numericality_of :amount }

    context 'amount' do
      let(:maximum_amount) { 15 }
      let(:perk) { create(:perk, maximum_amount: maximum_amount) }
      let(:reimbursement_request) { build(:reimbursement_request, perk: perk, amount: amount) }

      context 'when amount is less than perk amount' do
        let(:amount) { 10 }

        it 'is a valid request' do
          expect(reimbursement_request.save).to eq(true)
          expect(reimbursement_request.errors).to be_blank
        end
      end

      context 'when amount is equals to perk amount' do
        let(:amount) { maximum_amount }

        it 'is a valid request' do
          expect(reimbursement_request.save).to eq(true)
          expect(reimbursement_request.errors).to be_blank
        end
      end

      context 'when amount is greater than perk amount' do
        let(:amount) { 20 }

        it 'is not a valid request' do
          expect(reimbursement_request.save).to eq(false)
          expect(reimbursement_request.errors).to have_key(:amount)
        end
      end
    end
  end
end
