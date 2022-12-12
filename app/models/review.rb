class Review < ApplicationRecord
  validates :comment, presence: true, length: { maximum: 400 }

  belongs_to :user
  belongs_to :content, optional: true
end
