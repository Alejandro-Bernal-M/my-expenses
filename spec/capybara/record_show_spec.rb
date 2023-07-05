require 'rails_helper'

RSpec.describe 'Records', type: :feature do
  let(:user) { User.create(name: 'Test User', email: 'test@test.com', password: 'password') }
  let(:category) { Category.create(name: 'Test Category', icon: 'icons8-aeropuerto-48.png', user:) }
  let(:record) { Record.create(name: 'Test Record', amount: 100, author: user, category:) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  describe 'show' do
    it 'show the right page' do
      record
      visit user_category_record_path(user, category, record)
      expect(page).to have_content('Record details')
    end

    it 'shows the amount of the record' do
      record
      visit user_category_record_path(user, category, record)
      expect(page).to have_content('$100.0')
    end

    it 'shows the link' do
      record
      visit user_category_record_path(user, category, record)
      expect(page).to have_content('Destroy this record')
    end
  end
end
