require 'rails_helper'

RSpec.describe PerksController, type: :controller do
  let!(:organisation) { FactoryBot.create(:organisation) }
  let!(:employee) { FactoryBot.create(:employee, organisation: organisation) }

  describe "GET #index" do
    before { FactoryBot.create(:perk, organisation: organisation, name: 'Some perks') }

    context "when the user is authenticated" do
      it "raises unauthorized error" do
        get :index
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when the user is not authenticated" do
      it "returns a success response" do
        get :index, session: { employee_id: employee.id }
        expect(response).to be_successful
      end
    end
  end
end
