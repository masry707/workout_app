require 'rails_helper'

RSpec.feature 'Editing exercise' do
  before do
    @user = User.create!(first_name: 'first', last_name: 'last', email: 'user@example.com', password: 'password')
    login_as(@user)

    @ex = @user.exercises.create!(duration_in_min: 50, workout_details: 'Body Building routine', workout_date: Date.today)
  end

  scenario 'with valid input succeeds' do
    visit '/'
    click_link('My Lounge')

    link = "a[href='/users/#{@user.id}/exercises/#{@ex.id}/edit']"
    find(link).click

    fill_in 'Duration', with: 45
    click_button 'Update Exercise'

    expect(page).to have_content('Exercise has been updated')
    expect(page).to have_content(45)
    expect(page).not_to have_content(50)

  end
end