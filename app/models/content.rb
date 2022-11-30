class Content < ApplicationRecord
  validates :title, presence: true
  validates :genre, presence: true
  belongs_to :user
  has_one_attached :image
end
