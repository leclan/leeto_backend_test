require 'rails_helper'

RSpec.describe "welcome/index.html.erb", type: :view do
  it 'returns the welcome page' do
    render

    expect(rendered).to have_content 'Welcome to your benefits interface'
    expect(rendered).to have_content 'Access and manage all your company benefits in one single interface. To continue, please log in or subscribe.'
    expect(rendered).to have_link 'Log in', href: '/users/sign_in'
    expect(rendered).to have_link 'Sign up', href: '/users/sign_up'
  end
end
