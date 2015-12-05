require 'rails_helper'

RSpec.feature 'Signing user in' do

  before do
    @user = User.create!(first_name: 'first', last_name: 'last', email: 'user@example.com', password: 'password')
  end
  scenario 'user sign in with valid credentials' do
    visit '/'

    click_link 'Sign in'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content("Signed in as #{@user.email}")
  end
end