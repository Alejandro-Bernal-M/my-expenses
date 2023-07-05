class Record < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :category
  has_many :categories

  validates :name, presence: true
  validates :amount, presence: true
  validates :author, presence: true
  validates :category, presence: true
end
