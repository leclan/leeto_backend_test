# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Perk, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :maximum_amount }
  it { should validate_numericality_of :maximum_amount }

  describe 'scope' do
    describe 'active' do
      let!(:perk1) { create(:previous_perk) }
      let!(:perk2) { create(:perk) }
      let!(:perk3) { create(:future_perk) }

      subject { Perk.active }

      it 'retuns only actives perks during timelaps' do
        expect(subject.to_a).to contain_exactly(perk2)
        expect(subject.count).to eq 1
      end
    end
  end
end
