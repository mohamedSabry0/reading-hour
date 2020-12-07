class TimeBlock < ApplicationRecord
  validates :name, presence: true, length: { in: 3..6 }
  validates :amount, presence: true
  belongs_to :author, class_name: 'User'
  has_many :groupings
  has_many :groups, through: :groupings
end
