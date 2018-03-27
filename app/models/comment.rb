class Comment < ApplicationRecord
  belongs_to :task

  validates :content, presence: true, length: { in: 0..256 }
end
