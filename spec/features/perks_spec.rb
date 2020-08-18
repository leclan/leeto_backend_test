require "rails_helper"

RSpec.feature "Perk management", type: :feature do
  describe "Employee lists all perks" do
    let(:org1) { create(:organisation) }
    let(:employee) { create(:employee, organisation: org1) }
    let!(:perk1_org1) { create(:perk, name: 'netflix', organisation: org1) }
    let!(:perk2_org1) { create(:perk, name: 'chateau', organisation: org1) }

    let(:org2) { create(:organisation) }
    let!(:perk1_org2) { create(:perk, name: 'prime', organisation: org2) }
    let!(:perk2_org2) { create(:perk, name: 'theatre', organisation: org2) }

    scenario "when employee is not logged" do
      visit(perks_url)
      expect(page).to have_current_path(new_employee_session_path)
    end

    scenario "when employee is logged" do
      sign_in(employee)
      visit(perks_url)

      expect(page).to have_css('.perk', count: 2)
      expect(page).to have_content('netflix')
      expect(page).to have_content('chateau')
      expect(page).to have_no_content('prime')
      expect(page).to have_no_content('theatre')

      click_on('netflix')
      expect(page).to have_current_path(perk_path(perk1_org1))

      click_on(I18n.t('perks.show.request'))
      expect(page).to have_current_path(new_perk_reimbursement_request_path(perk1_org1))

      fill_in 'Amount', with: 12.99
      click_button
      expect(page).to have_current_path(perks_path)
      expect(page).to have_content(I18n.t('reimbursement_requests.create.created_successfully'))
    end
  end
end
