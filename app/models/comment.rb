class Comment < ApplicationRecord
  belongs_to :task

  validates :content, length: { in: 1..256 }
end
