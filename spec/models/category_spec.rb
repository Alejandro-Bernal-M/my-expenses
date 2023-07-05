require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'Test User', email: 'test@test.com', password: 'password') }
  let(:category) { Category.new(name: 'Test Category', icon: 'icons8-aeropuerto-48.png', user:) }

  it 'is valid with valid attributes' do
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category.name = nil
    expect(category).to_not be_valid
  end

  it 'is not valid without an icon' do
    category.icon = nil
    expect(category).to_not be_valid
  end

  it 'is associated with a user' do
    expect(category.user).to eq(user)
  end

  it 'has many records' do
    expect(category.records).to be_empty
  end

  it 'has a list of valid icons' do
    expect(Category::ICONS).to include('icons8-aeropuerto-48.png')
  end
end
