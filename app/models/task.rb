class Task < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :deadline, presence: true
end
