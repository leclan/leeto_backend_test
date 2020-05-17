require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe "#available_perks" do
    let!(:employee) { FactoryBot.create(:employee) }

    it 'returns perks' do
      FactoryBot.create(:perk, organisation: employee.organisation)

      expect(employee.available_perks.size).to eq(1)
    end

    it 'do not returns perks linked to another organisation' do
      FactoryBot.create(:perk, organisation: FactoryBot.create(:organisation))

      expect(employee.available_perks.size).to eq(0)
    end
  end
end
