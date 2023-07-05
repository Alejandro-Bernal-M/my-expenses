require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  let(:user) { User.create(name: 'Test User', email: 'test@test.com', password: 'password') }
  let(:category) { Category.create(name: 'Test Category', icon: 'icons8-aeropuerto-48.png', user: user) }
  let(:record) { Record.create(name: 'Test Record', amount: 100, author: user, category: category) }
  let(:record2) { Record.create(name: 'Test Record 2', amount: 200, author: user, category: category) }

  before (:each) do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  describe 'index' do
    it 'shows a list of categories' do
      category
      visit user_categories_path(user)
      expect(page).to have_content('Test Category')
    end

    it 'show the amount of records in each category' do
      record
      record2
      visit user_categories_path(user)
      expect(page).to have_content('$300.0')
    end
   
    it 'shows a link to create a new category' do
      category
      visit user_categories_path(user)
      expect(page).to have_content('New category')
    end
    
    it 'the button to create a new category redirects to the new category page' do
      category
      visit user_categories_path(user)
      click_link 'New category'
      expect(page).to have_content('New category')
    end
  end
end