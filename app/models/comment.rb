class Comment < ApplicationRecord
  belongs_to :task

  validates :content, presence: true, length: { in: 1..256 }
end
