class Record < ApplicationRecord
  belongs_to :user
  has_many :categories

  validates :name, presence: true
  validates :amount, presence: true
  validates :user_id, presence: true
end
