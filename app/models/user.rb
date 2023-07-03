class User < ApplicationRecord
  has_many :categories
  has_many :records, foreign_key: :author_id

  validates :name, presence: true
end
