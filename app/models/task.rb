class Task < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { in: 0..64 }
  validates :deadline, presence: true
end
