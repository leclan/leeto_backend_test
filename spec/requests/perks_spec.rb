require 'rails_helper'

RSpec.describe "Perks", type: :request do
  let!(:organisation) { FactoryBot.create(:organisation) }
  let!(:employee) { FactoryBot.create(:employee, organisation: organisation) }

  describe "GET /perks" do
    before do
      FactoryBot.create(:perk, organisation: organisation, name: 'Theatre tickets')
      post sessions_path(email: employee.email, password: 'some_password')
    end

    it "displays perks" do
      get perks_path
      expect(response).to have_http_status(200)
      expect(response.body).to include('Theatre tickets')
    end
  end
end
