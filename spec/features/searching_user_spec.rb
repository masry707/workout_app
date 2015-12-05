require 'rails_helper'

RSpec.feature 'Searching for member' do
  before do
    @john = User.create!(first_name: 'John', last_name: 'Doe', email: 'john@exapmle.com', password: 'password')
    @sarah = User.create!(first_name: 'Sarah', last_name: 'Doe', email: 'sarah@exapmle.com', password: 'password')
  end

  scenario 'with existing name returning all those users' do
    visit '/'
    fill_in 'search_name', with: 'Doe'
    click_button 'Search'

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)

    expect(page.current_path).to eq('/pages/search')

  end
end