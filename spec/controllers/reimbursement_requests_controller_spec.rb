require 'rails_helper'

RSpec.describe ReimbursementRequestsController, type: :controller do
  describe 'GET #new' do
    let(:org) { create(:organisation)}
    let(:perk) { create(:perk, organisation: org) }

    subject { get :new, params: { perk_id: perk.id } }

    context 'when employee is not logged' do
      it 'returns http redirect' do
        subject
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'when employee is logged' do
      let(:employee) { create(:employee, organisation: org) }

      before { sign_in(employee) }

      context 'when perk exists' do
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

      context 'when perk is from another org' do
        let(:other_org) { create(:organisation) }
        let(:perk) { create(:perk, organisation: other_org) }

        it 'returns http not found' do
          expect { subject }
            .to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end

  describe 'POST #create' do
    let(:org) { create(:organisation)}
    let(:perk) { create(:perk, organisation: org) }

    subject { post :create, params: { perk_id: perk.id, reimbursement_request: { amount: 5 } } }

    context 'when employee is not logged' do
      it 'returns http redirect' do
        subject
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'when employee is logged' do
      let(:employee) { create(:employee, organisation: org) }

      before { sign_in(employee) }

      context 'when perk exists' do
        it 'returns http redirect' do
          subject
          expect(response).to redirect_to(perks_path)
          expect(response).to have_http_status(:redirect)
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

      context 'when perk is from another org' do
        let(:other_org) { create(:organisation) }
        let(:perk) { create(:perk, organisation: other_org) }

        it 'returns http not found' do
          expect { subject }
            .to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end
end
