require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    Organisation.create(name: 'leeto')
  end

  it 'is invalid with default attributes' do
    expect(User.new).to be_invalid
  end

  it 'is not valid without an organisation id' do
    expect(User.new({email: 'admin@leeto.com', password: '123456', password_confirmation: '123456'})).to be_invalid
  end

  it 'is valid with an organisation id' do
    org = Organisation.find_by(name: 'leeto')
    expect(User.new({email: 'admin@leeto.com', password: '123456', password_confirmation: '123456', organisation_id: org[:id]})).to be_valid
  end
end
