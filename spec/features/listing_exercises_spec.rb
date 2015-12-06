require 'rails_helper'

RSpec.feature 'Listing exercises' do
  before do
    @user = User.create!(first_name: 'first', last_name: 'last', email: 'user@example.com', password: 'password')
    @friend = User.create!(first_name: 'John', last_name: 'last', email: 'john@example.com', password: 'password')
    login_as(@user)

    @ex1 = @user.exercises.create!(duration_in_min: 50, workout_details: 'Body Building routine', workout_date: Date.today)
    @ex2 = @user.exercises.create!(duration_in_min: 30, workout_details: 'Walking', workout_date: Date.today)

    @following = Friendship.create(user: @user, friend: @friend)
  end

  scenario 'shows user\'s workout last 7 days' do
    visit '/'
    click_link('My Lounge')

    expect(page).to have_content(@ex1.duration_in_min)
    expect(page).to have_content(@ex1.workout_details)
    expect(page).to have_content(@ex1.workout_date)

    expect(page).to have_content(@ex2.duration_in_min)
    expect(page).to have_content(@ex2.workout_details)
    expect(page).to have_content(@ex2.workout_date)
  end

  scenario 'shows a list of user\'s friends' do
    visit '/'

    click_link 'My Lounge'

    expect(page).to have_content('My Friends')
    expect(page).to have_link(@friend.full_name)
    expect(page).to have_link('Unfollow')

  end
end