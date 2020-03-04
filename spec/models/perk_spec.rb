require 'rails_helper'

RSpec.describe Perk, type: :model do
  before(:all) do
    Organisation.create(name: 'leeto')
  end

  it 'is invalid with default attributes' do
    expect(Perk.new).to be_invalid
  end

  it 'is not valid without an organisation id' do
    expect(Perk.new({name: 'subsidy', amount: 100.00, start: Date.today, end: Date.today + 1.months})).to be_invalid
  end

  it 'is not valid without a name' do
    org = Organisation.find_by(name: 'leeto')
    expect(Perk.new({amount: 100.00, start: Date.today, end: Date.today + 1.months, organisation_id: org.id})).to be_invalid
  end

  it 'is not valid without an amount' do
    org = Organisation.find_by(name: 'leeto')
    expect(Perk.new({name: 'subsidy', start: Date.today, end: Date.today + 1.months, organisation_id: org.id})).to be_invalid
  end

  it 'is valid with an amount, a name and an organisation id' do
    org = Organisation.find_by(name: 'leeto')
    expect(Perk.new({name: 'subsidy', amount: 100.00, start: Date.today, end: Date.today + 1.months, organisation_id: org.id})).to be_valid
  end
end
