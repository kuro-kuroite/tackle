class Task < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :name, length: { in: 1..64 }
  validates :deadline, presence: true
end
