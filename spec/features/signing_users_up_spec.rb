require 'rails_helper'

RSpec.feature 'Signing user up' do
  scenario 'user sign up with valid credentials' do
    visit '/'

    click_link('Sign up')

    fill_in 'Email', with: 'me@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content('You have signed up successfully.')
  end
end