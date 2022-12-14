class Post < ApplicationRecord
  validates :text, presence: true, length: { maximum: 200 }
  belongs_to :user
  has_one_attached :image
end
