 require 'rails_helper'

RSpec.describe "/reimbursement_requests", type: :request do
  let!(:organisation) { FactoryBot.create(:organisation) }
  let!(:employee) { FactoryBot.create(:employee, organisation: organisation) }
  let!(:perk) { FactoryBot.create(:perk, organisation: organisation, name: 'Theater tickets', maximum_amount: 30)}

  before { post sessions_path(email: employee.email, password: 'some_password') }

  describe "GET /show" do
    it "renders a successful response" do
      reimbursement_request = FactoryBot.create(:reimbursement_request, employee: employee, perk: perk, amount: 15)

      get perk_reimbursement_request_url(perk, reimbursement_request)
      expect(response).to be_successful
      expect(response.body).to include('15 euros')
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_perk_reimbursement_request_url(perk)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ReimbursementRequest" do
        expect {
          post perk_reimbursement_requests_url(perk), params: { reimbursement_request: { amount: 5 } }
        }.to change(ReimbursementRequest, :count).by(1)
      end

      it "redirects to the created reimbursement_request" do
        post perk_reimbursement_requests_url(perk), params: { reimbursement_request: { amount: 5 } }
        expect(response).to redirect_to(perk_reimbursement_request_path(perk, ReimbursementRequest.last))
      end
    end

    context "with missing parameters" do
      it "raises a ParameterMissing error" do
        expect {
          post perk_reimbursement_requests_url(perk), params: {}
        }.to raise_error(ActionController::ParameterMissing)
      end
    end

    context "with invalid amount parameter" do
      it "does not save the reimbursement request" do
        expect {
          post perk_reimbursement_requests_url(perk), params: { reimbursement_request: { amount: 999 } }
        }.to change(ReimbursementRequest, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post perk_reimbursement_requests_url(perk), params: { reimbursement_request: { amount: 999 } }
        expect(response).to be_successful
        expect(response.body).to include('Amount exceeds maximum allowed for the perk')
      end
    end
  end
end
