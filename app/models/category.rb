class Category < ApplicationRecord
  belongs_to :user
  has_many :records

  validates :name, presence: true
  validates :icon, presence: true

  ICONS = Dir.glob('app/assets/images/icons/*.png').map { |path| path.split('/').last }.freeze
end
