require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録機能' do
    context 'ユーザー登録できる' do
      it 'すべての情報が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
      it 'profileがからでも登録できる' do
        @user.profile = ''
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録でいない' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ユーザー名を入力してください')
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'testemail'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end
      it 'すでに存在するemailでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaabbb'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードに誤りがあります、半角英数字を含めてください')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードに誤りがあります、半角英数字を含めてください')
      end
      it 'passwordに全角文字が含まれると登録できない' do
        @user.password = 'テストテストテスト'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードに誤りがあります、半角英数字を含めてください')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '111aa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが41字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 41)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは40文字以内で入力してください')
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password = '12345a'
        @user.password_confirmation = '12345b'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
    end
  end
end
