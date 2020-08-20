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
    let(:perk_id) { perk.id }

    subject { get :show, params: { id: perk_id } }

    context 'when employee is not logged' do
      let(:perk_id) { -1 }

      it 'returns http redirect' do
        subject
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
          subject
          expect(response).to have_http_status(:success)
        end
      end

      context 'when perk is expired' do
        let(:perk) { create(:previous_perk, organisation: org) }

        it 'returns http not found' do
          expect { subject }
            .to raise_error ActiveRecord::RecordNotFound
        end
      end

      context 'when perk is not available yet' do
        let(:perk) { create(:future_perk, organisation: org) }

        it 'returns http not found' do
          expect { subject }
            .to raise_error ActiveRecord::RecordNotFound
        end
      end

      context 'when employee is not senior enough' do
        let(:perk) { create(:perk, organisation: org, seniority: 24) }

        it 'returns http not found' do
          expect { subject }
            .to raise_error ActiveRecord::RecordNotFound
        end
      end

      context 'when perk is from another org' do
        let(:other_org) { create(:organisation) }
        let(:perk) { create(:perk, organisation: other_org) }

        it 'returns http not found' do
          expect { subject }
            .to raise_error ActiveRecord::RecordNotFound
        end
      end

      context 'when perk doesnt exist' do
        let(:perk_id) { -1 }

        it 'returns http not found' do
          expect { subject }
            .to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end
end
