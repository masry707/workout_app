require 'rails_helper'

RSpec.feature 'Listing members' do
  before do
    @john = User.create!(first_name: 'John', last_name: 'Doe', email: 'john@exapmle.com', password: 'password')
    @sarah = User.create!(first_name: 'Sarah', last_name: 'Doe', email: 'sarah@exapmle.com', password: 'password')
  end

  scenario 'show a list of registered users' do
    visit '/'
    expect(page).to have_content('Listing of Members')
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
  end
end