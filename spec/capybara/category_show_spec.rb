require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  let(:user) { User.create(name: 'Test User', email: 'test@test.com', password: 'password') }
  let(:category) { Category.create(name: 'Test Category', icon: 'icons8-aeropuerto-48.png', user:) }
  let(:record) { Record.create(name: 'Test Record', amount: 100, author: user, category:) }
  let(:record2) { Record.create(name: 'Test Record 2', amount: 200, author: user, category:) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  describe 'show' do
    it 'show the right page' do
      record
      record2
      visit user_category_path(user, category)
      expect(page).to have_content('Category details')
    end

    it 'shows the total amount of records' do
      record
      record2
      visit user_category_path(user, category)
      expect(page).to have_content('$300.0')
    end

    it 'shows the links' do
      visit user_category_path(user, category)
      expect(page).to have_content('See records for this category')
      expect(page).to have_content('Destroy this category')
    end
  end
end
