require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end
  describe 'レビュー保存' do
    it 'commentが入力されていれば保存できる' do
      expect(@review).to be_valid
    end

    it 'commentが空では登録できない' do
      @review.comment = ''
      @review.valid?
      expect(@review.errors.full_messages).to include("Comment can't be blank")
    end

    it 'commentが201文字以上では登録できない' do
      @review.comment = Faker::Lorem.characters(201)
      @review.valid?
      expect(@review.errors.full_messages).to include("Comment is too long (maximum is 200 characters)")
    end

    it 'userが紐付いていないと登録できない' do
      @review.user = nil
      @review.valid?
      expect(@review.errors.full_messages).to include("User must exist")
    end

    it 'contentが紐付いていないと登録できない' do
      @review.content = nil
      @review.valid?
      expect(@review.errors.full_messages).to include("Content must exist")
    end
  end
end
