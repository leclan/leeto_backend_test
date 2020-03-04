require 'rails_helper'

RSpec.describe PerkRequestsController, type: :controller do
  login_user

  describe 'GET #index' do
    it 'returns the list of perk requests for a valid user' do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:perk_requests).length).to eq(1)
      expect(assigns(:perk_requests).first.amount).to eq(50)
    end
  end

  describe 'GET #show' do
    it 'returns a perk request for a valid user' do
      get :index
      perk_request_id = assigns(:perk_requests).first.id
      get :show, params: { id: perk_request_id }
      expect(response).to have_http_status(:success)
      expect(assigns(:perk_request).amount).to eq(50)
    end
  end

  describe 'GET #new' do
    it 'returns a new perk request for a form' do
      get :index
      perk_id = assigns(:perk_requests).first.perk.id
      get :new, params: { id: perk_id }
      expect(response).to have_http_status(:success)
      expect(assigns(:perk_request).user_id).to eq(subject.current_user.id)
      expect(assigns(:perk_request).perk_id).to eq(perk_id)
    end
  end

  describe 'POST #create' do
    it 'fails to create invalid request' do
      get :index
      perk_id = assigns(:perk_requests).first.perk.id
      post :create, params: { perk_request: { amount: 100, perk_id: perk_id, user_id: subject.current_user.id}}
      expect(response).to redirect_to("/perks/#{perk_id}")
      expect(flash[:alert]).to eq('Invalid request')
    end

    it 'fails to create invalid request' do
      get :index
      perk_id = assigns(:perk_requests).first.perk.id
      post :create, params: { perk_request: { perk_id: perk_id, user_id: subject.current_user.id}}
      expect(response).to redirect_to("/perks/#{perk_id}")
      expect(flash[:alert]).to eq('Invalid request')
    end

    it 'creates a new request' do
      get :index
      perk_id = assigns(:perk_requests).first.perk.id
      post :create, params: { perk_request: { amount: 20, perk_id: perk_id, user_id: subject.current_user.id}}
      request = PerkRequest.find_by_sql('SELECT id FROM perk_requests WHERE amount = 20').first
      expect(response).to redirect_to("/perk_requests/#{request.id}")
    end
  end

end
