require 'rails_helper'

RSpec.describe Content, type: :model do
  before do
    @content = FactoryBot.build(:content)
  end

  describe 'コンテンツ投稿機能' do
    context 'コンテンツが投稿できるとき' do
      it 'すべての情報が入力されていれば保存できる' do
        expect(@content).to be_valid
      end
      it '画像(image)がなくても投稿できる' do
        @content.image = nil
        expect(@content).to be_valid
      end
      it 'memoが空でも投稿できる' do
        @content.memo = ''
        expect(@content).to be_valid
      end
    end
    context 'コンテンツが保存できないとき' do
      it 'titleが空では保存できない' do
        @content.title = ''
        @content.valid?
        expect(@content.errors.full_messages).to include('タイトルを入力してください')
      end
      it 'genreが空では保存できない' do
        @content.genre = ''
        @content.valid?
        expect(@content.errors.full_messages).to include('ジャンルを入力してください')
      end
      it 'memoが60文字以上では保存できない' do
        @content.memo = Faker::Lorem.characters(number: 61)
        @content.valid?
        expect(@content.errors.full_messages).to include('Memoは60文字以内で入力してください')
      end
      it 'userが紐付いていないと保存できない' do
        @content.user = nil
        @content.valid?
        expect(@content.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
