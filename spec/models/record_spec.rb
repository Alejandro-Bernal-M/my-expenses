require 'rails_helper'

RSpec.describe Record, type: :model do
  let(:author) { User.create(name: 'Test User', email: 'test@test.com', password: 'password') }
  let(:category) { Category.create(name: 'Test Category') }
  let(:record) { Record.new(name: 'Test Record', amount: 100, author:, category:) }

  it 'is valid with valid attributes' do
    expect(record).to be_valid
  end

  it 'is not valid without a name' do
    record.name = nil
    expect(record).to_not be_valid
  end

  it 'is not valid without an amount' do
    record.amount = nil
    expect(record).to_not be_valid
  end

  it 'is not valid without an author' do
    record.author = nil
    expect(record).to_not be_valid
  end

  it 'is not valid without a category' do
    record.category = nil
    expect(record).to_not be_valid
  end
end
