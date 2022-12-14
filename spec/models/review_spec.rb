require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    user = FactoryBot.create(:user)
    content = FactoryBot.create(:content)
    @review = FactoryBot.build(:review, user_id: user.id, content_id: content.id)
    sleep 0.1
  end
  describe 'レビュー保存' do
    it 'commentが入力されていれば保存できる' do
      expect(@review).to be_valid
    end

    it 'commentが空では登録できない' do
      @review.comment = ''
      @review.valid?
      expect(@review.errors.full_messages).to include('コメントを入力してください')
    end

    it 'commentが401文字以上では登録できない' do
      @review.comment = 'kyxye5cw6yolh5delwi0iiwu374e9wv3iajfq6m77jqe348rb1rt2g2g1vqzwlvhuww008plefqfa3pstf7zoioy5s24noudh59mlz993hqcpk1fvbh0cyzshsrzv9bl7e3fgoquxufyq90yxexqabi4btc0mpl0eyv2a0xr0ku2geysx96dkj38czhb5e2j0qbj4bav3ba3jezj3qu63m1ob0dns7r09c0n6ptd35yiadlmztz6qxlxm1w9loqww008plefqfa3pstf7zoioy5s24noudh59mlz993hqcpk1fvbh0cyzshsrzv9bl7e3fgoquxufyq90yxexqabi4btc0mpl0eyv2a0xr0ku2geysx96dkj38czhb5e2j0qbj4bav3ba3jezj3qu'
      @review.valid?
      expect(@review.errors.full_messages).to include('コメントは400文字以内で入力してください')
    end

    it 'userが紐付いていないと登録できない' do
      @review.user_id = nil
      @review.valid?
      expect(@review.errors.full_messages).to include('Userを入力してください')
    end

    it 'contentが紐付いていないと登録できない' do
      @review.content_id = nil
      @review.valid?
      expect(@review.errors.full_messages).to include('Contentを入力してください')
    end
  end
end
