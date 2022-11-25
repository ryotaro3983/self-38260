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
        
      end
      it 'emailが空だと登録できない' do
        
      end
      it 'emailに@が含まれていないと登録できない' do
        
      end
      it 'すでに存在するemailでは登録できない' do
        
      end
      it 'passwordが空だと登録できない' do
        
      end
      it 'passwordが英字のみでは登録できない' do
        
      end
      it 'passwordが数字のみでは登録できない' do
        
      end
      it 'passwordに全家具文字が含まれると登録できない' do
        
      end
      it 'passwordが5文字以下では登録できない' do
        
      end
      it 'passwordが41字以上では登録できない' do
        
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        
      end
      it 'password_confirmationが空だと登録できない' do
        
      end
    end
  end
end
