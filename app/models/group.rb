class Group < ApplicationRecord
  validates :name, presence: true, length: { in: 3..12 }
  belongs_to :user
  has_many :groupings, dependent: :destroy
  has_many :time_blocks, through: :groupings

  has_one_attached :icon, dependent: :destroy
end
