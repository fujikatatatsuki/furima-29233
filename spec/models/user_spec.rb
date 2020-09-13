require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が成功する場合' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
      it 'ニックネームが入力されていれば登録できる' do
        @user.nickname
        expect(@user).to be_valid
      end
      it 'メールアドレスが入力されており、＠が含まれていれば登録できる' do
        @user.email
        expect(@user).to be_valid
      end
      it 'パスワードが入力されており、６文字以上で半角英数字混合であれば登録できる' do
        @user.password
        @user.password_confirmation
        expect(@user).to be_valid
      end
      it 'パスワードは確認用を含めて２回入力されていれば登録できる' do
        @user.password
        @user.password_confirmation
        expect(@user).to be_valid
      end
      it 'ユーザー本名の名字と名前がそれぞれ入力されており、全角（漢字・ひらがな・カタカナ）で入力されていれば登録できる' do
        @user.full_width_family_name
        @user.full_width_name
        expect(@user).to be_valid
      end
      it 'ユーザー本名のフリガナが、名字と名前でそれぞれ入力されており、全角（カタカナ）で入力されていれば登録できる' do
        @user.full_width_kana_family_name
        @user.full_width_kana_name
        expect(@user).to be_valid
      end
      it '生年月日が入力されていれば登録できる' do
        @user.birthday
        expect(@user).to be_valid
      end
    end

    context '新規登録が失敗する場合' do
      it 'ニックネームが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが重複（一意性）していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに＠を含まないと登録できない' do
        @user.email = '123456gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは５文字以下であると登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが半角英数字混合でないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが入力されていても、確認用パスワードが入力されていなければ登録できない' do
        @user.password
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー本名の名字が入力されていても、名前が入力されていなければ登録できない' do
        @user.full_width_family_name
        @user.full_width_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Full width name can't be blank", 'Full width name is invalid')
      end
      it 'ユーザー本名の名前が入力されていても、名字が入力されていなければ登録できない' do
        @user.full_width_family_name = ''
        @user.full_width_name
        @user.valid?
        expect(@user.errors.full_messages).to include("Full width family name can't be blank", 'Full width family name is invalid')
      end
      it 'ユーザー本名は英語で入力されると登録できない' do
        @user.full_width_family_name = 'yamada'
        @user.full_width_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Full width family name is invalid', 'Full width name is invalid')
      end
      it 'ユーザー本名のフリガナは、名字が入力されていても名前が入力されていなければ登録できない' do
        @user.full_width_kana_family_name
        @user.full_width_kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Full width kana name can't be blank", 'Full width kana name is invalid')
      end
      it 'ユーザー本名のフリガナは、名前が入力されていても名字が入力されていなければ登録できない' do
        @user.full_width_kana_family_name = ''
        @user.full_width_kana_name
        @user.valid?
        expect(@user.errors.full_messages).to include("Full width kana family name can't be blank", 'Full width kana family name is invalid')
      end
      it 'ユーザー本名のフリガナは全角（ひらがな）で入力されていれば登録できない' do
        @user.full_width_kana_family_name = 'やまだ'
        @user.full_width_kana_name = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Full width kana family name is invalid', 'Full width kana name is invalid')
      end
      it 'ユーザー本名のフリガナは全角（漢字）で入力されていれば登録できない' do
        @user.full_width_kana_family_name = '山田'
        @user.full_width_kana_name = '太朗'
        @user.valid?
        expect(@user.errors.full_messages).to include('Full width kana family name is invalid', 'Full width kana name is invalid')
      end
      it 'ユーザー本名のフリガナは全角（英語）で入力されていれば登録できない' do
        @user.full_width_kana_family_name = 'yamada'
        @user.full_width_kana_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Full width kana family name is invalid', 'Full width kana name is invalid')
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
