require 'rails_helper'

RSpec.describe ReimbursementRequest, type: :model do
  let!(:organisation) { FactoryBot.create(:organisation) }
  let!(:employee) { FactoryBot.create(:employee, organisation: organisation, seniority: 6) }

  describe "#below_maximum?" do
    let!(:perk) { FactoryBot.create(:perk, organisation: organisation, maximum_amount: 30)}

    context "when the amount is above maximum allowed for the perk" do
      it "raises an error" do
        reimbursement_request = FactoryBot.build(:reimbursement_request, employee: employee, perk: perk, amount: 100)
        expect(reimbursement_request.valid?).to be_falsey
      end
    end

    context "when the amount is below maximum allowed for the perk" do
      it "returns true" do
        reimbursement_request = FactoryBot.build(:reimbursement_request, employee: employee, perk: perk, amount: 10)
        expect(reimbursement_request.valid?).to be_truthy
      end
    end
  end

  describe '#employee_eligible?' do
    context "when the employee is not eligible because of his seniority" do
      let!(:perk_rule) { FactoryBot.build(:perk_rule, property: 'seniority', operator: 'gt', value: 12) }
      let!(:perk) { FactoryBot.create(:perk, organisation: organisation, rules: [perk_rule]) }

      it "return true" do
        reimbursement_request = FactoryBot.build(:reimbursement_request, employee: employee, perk: perk)
        expect(reimbursement_request.valid?).to be_falsey
      end
    end

    context "when the employee is eligible because of his seniority" do
      let!(:perk_rule) { FactoryBot.build(:perk_rule, property: 'seniority', operator: 'gt', value: 3) }
      let!(:perk) { FactoryBot.create(:perk, organisation: organisation, rules: [perk_rule]) }

      it "return true" do
        reimbursement_request = FactoryBot.build(:reimbursement_request, employee: employee, perk: perk)
        expect(reimbursement_request.valid?).to be_truthy
      end
    end
  end
end
