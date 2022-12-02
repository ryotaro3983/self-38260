class Review < ApplicationRecord
  validates :comment, presence: true, length: {maximum: 200}

  belongs_to :user
  belongs_to :content
end
