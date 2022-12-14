class Review < ApplicationRecord
  with_options presence: true do
    validates :comment, length: { maximum: 400 }
    validates :user_id
    validates :content_id
  end

  belongs_to :user
  belongs_to :content, optional: true
end
