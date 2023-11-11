require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationと名前と名前カナと生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含めて設定してください')
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含めて設定してください')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'パスワード１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含めて設定してください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'password123'
        @user.password_confirmation = 'differentpass'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        duplicate_user = FactoryBot.create(:user, email: @user.email)
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testemail.com' # @を含まないemailを設定
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'passw' # 5文字以下のパスワードを設定
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = 'a' * 129 # 129文字以上のパスワードを設定
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it '苗字が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '苗字が英数字では登録できない' do
        @user.first_name = 'John123' # 英数字を含む名前を設定
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は漢字、ひらがな、カタカナのみを含めてください')
      end
      it '名前が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '名前が英数字では登録できない' do
        @user.last_name = 'John123' # 英数字を含む名前を設定
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は漢字、ひらがな、カタカナのみを含めてください')
      end
      it '苗字カナが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '苗字カナがカタカナ以外では登録できない' do
        @user.first_name_kana = 'あいうえお' # カタカナ以外の文字を含む名前カナを設定
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana はカタカナで入力してください')
      end
      it '名前カナが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it '名前カナがカタカナ以外では登録できない' do
        @user.last_name_kana = 'あいうえお' # カタカナ以外の文字を含む名前カナを設定
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana はカタカナで入力してください')
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
