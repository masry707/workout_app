require 'rails_helper'

RSpec.feature 'deleting exercise' do
  before do
    @user = User.create!(email: 'user@example.com', password: 'password')
    login_as(@user)

    @ex = @user.exercises.create!(duration_in_min: 50, workout_details: 'Body Building routine', workout_date: Date.today)
  end

  scenario do
    visit '/'
    click_link('My Lounge')

    link = "//a[contains(@href, '/users/#{@user.id}/exercises/#{@ex.id}') and .//text()='Delete']"
    find(:xpath, link).click

    expect(page).to have_content('Exercise has been deleted')
  end
end