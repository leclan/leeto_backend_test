require 'rails_helper'

RSpec.describe PerkRequest, type: :model do
  before(:all) do
    org = Organisation.create(name: 'leeto')
    @user = User.create(email: 'admin@leeto.com', password: '123456', password_confirmation: '123456', organisation_id: org.id)
    @perk = Perk.create(name: 'subsidy', amount: 100.00, start: Date.today, end: Date.today + 1.months, organisation_id: org.id)
  end

  it 'is invalid with default attributes' do
    expect(PerkRequest.new).to be_invalid
  end

  it 'is not valid without a user id' do
    params = {perk_id: @perk.id, amount: 50}
    expect(PerkRequest.new(params)).to be_invalid
  end

  it 'is not valid without a perk id' do
    params = {user_id: @user.id, amount: 50}
    expect(PerkRequest.new(params)).to be_invalid
  end

  it 'is not valid without an amount' do
    params = {user_id: @user.id, perk_id: @perk.id}
    expect(PerkRequest.new(params)).to be_invalid
  end

  it 'is valid with an amount, a name and an organisation id' do
    params = {user_id: @user.id, perk_id: @perk.id, amount: 50}
    expect(PerkRequest.new(params)).to be_valid
  end

  it 'is should return the right available amount' do
    params = {user_id: @user.id, perk_id: @perk.id, amount: 50}
    request = PerkRequest.create(params)
    expect(request.get_available_amount).to eq(50)
  end
end
