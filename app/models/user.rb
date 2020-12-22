class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true,
                       length: { in: 3..12 },
                       uniqueness: true

  has_many :time_blocks, foreign_key: :author_id
  has_many :groups
end
