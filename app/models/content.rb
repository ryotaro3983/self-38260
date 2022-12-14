class Content < ApplicationRecord
  validates :title, presence: true, length: { maximum: 150 }
  validates :genre, presence: true
  validates :memo, length: { maximum: 60 }

  belongs_to :user
  has_many :reviews, -> { order(created_at: :desc) }, dependent: :destroy
  has_one_attached :image
end
