module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      org = Organisation.create(name: 'leeto')
      user = User.create(email: 'admin@leeto.com', password: '123456', password_confirmation: '123456', organisation_id: org.id)
      perk = Perk.create(name: 'subsidy', amount: 100.00, start: Date.today, end: Date.today + 1.months, organisation_id: org.id)
      Perk.create(name: 'subsidy in the past', amount: 50.00, start: Date.today - 2.months, end: Date.today - 1.months, organisation_id: org.id)
      Perk.create(name: 'subsidy in the future', amount: 40.00, start: Date.today + 1.months, end: Date.today + 2.months, organisation_id: org.id)
      PerkRequest.create(user_id: user.id, perk_id: perk.id, amount: 50)
      sign_in user
    end
  end
end
