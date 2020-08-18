require 'rails_helper'

RSpec.describe PerksController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    context 'when perk exists' do
      let(:perk) { create(:perk) }

      it 'returns http success' do
        get :show, params: { id: perk.id }
        expect(response).to have_http_status(:success)
      end
    end

    context 'when perk doesnt exist' do
      it 'returns http not found' do
        expect { get :show, params: { id: -1 } }
          .to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
