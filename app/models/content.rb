class Content < ApplicationRecord
  validates :title, presence: true
  validates :genre, presence: true
  validates :memo, length: { maximum: 200 }
  belongs_to :user
  has_one_attached :image
end
