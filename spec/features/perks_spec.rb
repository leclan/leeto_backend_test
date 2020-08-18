require "rails_helper"

RSpec.feature "Perk management", type: :feature do
  before do
    FactoryBot.create_list(:perk, 3)
  end
  
  scenario "Employee lists all perks" do
    visit perks_url
    expect(page).to have_css('.perk', count: 3)
  end
end
