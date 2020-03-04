require 'rails_helper'

RSpec.describe PerksController, type: :controller do
  login_user

  describe 'GET #index' do
    it 'returns the list of perks for a valid user' do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:perks).length).to eq(1)
      expect(assigns(:perks).first.name).to eq('subsidy')
    end
  end

  describe 'GET #show' do
    it 'returns a single perk' do
      get :index
      perk_id = assigns(:perks).first[:id]
      get :show, params: { id: perk_id }
      expect(assigns(:perk).name).to eq('subsidy')
      expect(assigns(:perk_requests_sum)).to eq(50)
      expect(assigns(:perk_request)[:perk_id]).to eq(perk_id)
    end
  end
end
