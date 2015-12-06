require 'rails_helper'

RSpec.feature 'Following friends' do
  before do
    @john = User.create!(first_name: 'John', last_name: 'Doe', email: 'john@exapmle.com', password: 'password')
    @sarah = User.create!(first_name: 'Sarah', last_name: 'Doe', email: 'sarah@exapmle.com', password: 'password')

    login_as @john
  end

  scenario 'if signed in succeed' do
    visit '/'

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
    expect(page).not_to have_link('Follow', href: "/friendships?friend_id=#{@john.id}")

    link = "a[href='/friendships?friend_id=#{@sarah.id}']"
    find(link).click

    expect(page).not_to have_link('Follow', :href => "/friendships?friend_id=#{@sarah.id}")

  end
end