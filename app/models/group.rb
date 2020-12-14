class Group < ApplicationRecord
  validates :name, presence: true, length: { in: 3..12 }
  validates :icon, presence: true
  belongs_to :user
  has_many :groupings
  has_many :time_blocks, through: :groupings

end
