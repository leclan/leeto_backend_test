require 'rails_helper'

RSpec.describe PerksController, type: :controller do
  describe 'GET #index' do
    context 'when employee is not logged' do
      it 'returns http redirect' do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'when employee is logged' do
      let(:employee) { create(:employee) }

      it 'returns http success' do
        sign_in(employee)
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET #show' do
    context 'when employee is not logged' do
      it 'returns http redirect' do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'when employee is logged' do
      let(:org) { create(:organisation) }
      let(:employee) { create(:employee, organisation: org) }
      before { sign_in(employee) }

      context 'when perk exists' do
        let(:perk) { create(:perk, organisation: org) }

        it 'returns http success' do
          get :show, params: { id: perk.id }
          expect(response).to have_http_status(:success)
        end
      end

      context 'when perk is from another org' do
        let(:other_org) { create(:organisation) }
        let(:perk) { create(:perk, organisation: other_org) }

        it 'returns http not found' do
          expect { get :show, params: { id: perk.id } }
            .to raise_error ActiveRecord::RecordNotFound
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
end
