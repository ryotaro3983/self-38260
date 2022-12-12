class Content < ApplicationRecord
  validates :title, presence: true
  validates :genre, presence: true
  validates :memo, length: { maximum: 200 }

  belongs_to :user
  has_many :reviews, -> { order(created_at: :desc) }, dependent: :destroy
  has_one_attached :image
end
