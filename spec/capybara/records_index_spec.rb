require 'rails_helper'

RSpec.describe 'Records', type: :feature do
  let(:user) { User.create(name: 'Test User', email: 'test@test.com', password: 'password') }
  let(:category) { Category.create(name: 'Test Category', icon: 'icons8-aeropuerto-48.png', user: user) }
  let(:record) { Record.create(name: 'Test Record', amount: 100, author: user, category: category) }
  let(:record2) { Record.create(name: 'Test Record 2', amount: 200, author: user, category: category) }
  
  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in' 
  end

  describe 'index' do
    it 'has the rigth title' do
      category
      visit user_category_records_path(user, category)
      expect(page).to have_content("Records for #{category.name}")
    end

    it 'shows a list of records' do
      record
      record2
      visit user_category_records_path(user, category)
      expect(page).to have_content('Test Record')
      expect(page).to have_content('Test Record 2')
    end

    it 'shows the button to create a new record' do
      category
      visit user_category_records_path(user, category)
      expect(page).to have_content('New record')
    end

    it 'the button to create a new record redirects to the new record page' do
      category
      visit user_category_records_path(user, category)
      click_link 'New record'
      expect(page).to have_content('New Record')
      expect(page).to have_field('record[name]', placeholder: 'Name')
      expect(page).to have_field('record[amount]', placeholder: '$ Amount')
    end
  end
end