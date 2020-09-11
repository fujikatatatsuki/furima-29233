require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が成功する場合' do
      it "全ての値が正しく入力されていれば登録できる" do
        expect(@user).to be_valid
      end
      it "ニックネームが入力されていれば登録できる" do
        @user.nickname
        expect(@user).to be_valid
      end
      it "メールアドレスが入力されており、＠が含まれていれば登録できる" do
        @user.email
        expect(@user).to be_valid
      end
      # it "メールアドレスが一意性であること" do
      # end
      it "パスワードが入力されており、６文字以上で半角英数字混合であれば登録できる" do
        @user.password
        @user.encrypted_password
        expect(@user).to be_valid
      end
      it "パスワードは確認用を含めて２回入力されていれば登録できる" do
        @user.password
        @user.encrypted_password
        expect(@user).to be_valid
      end
      it "ユーザー本名の名字と名前がそれぞれ入力されており、全角（漢字・ひらがな・カタカナ）で入力されていれば登録できる" do
        @user.full_width_family_name
        @user.full_width_name
        expect(@user).to be_valid
      end
      it "ユーザー本名のフリガナが、名字と名前でそれぞれ入力されており、全角（カタカナ）で入力されていれば登録できる" do
        @user.full_width_kana_family_name
        @user.full_width_kana_name
        expect(@user).to be_valid
      end
      it "生年月日が入力されていれば登録できる" do
        @user.birthday
        expect(@user).to be_valid
      end
    end

    context '新規登録が失敗する場合' do
      it "ニックネームが空だと登録できない" do
      end
      it "メールアドレスが空だと登録できない" do
      end
      it "メールアドレスが重複（一意性）していると登録できない" do
      end
      it "メールアドレスに＠を含まないと登録できない" do
      end
      it "パスワードが空だと登録できない" do
      end
      it "パスワードは６文字以下であると登録できない" do
      end
      it "パスワードが半角英数字混合でないと登録できない" do
      end
      it "パスワードは確認用を含めて１回しか入力していないと登録できない" do
      end
      it "ユーザー本名の名前が入力されていても、名字が入力されていなければ登録できない" do
      end
      it "ユーザー本名の名字が入力されていても、名前が入力されていなければ登録できない" do
      end
      it "ユーザー本名は英語で入力されると登録できない" do
      end
      it "ユーザー本名のフリガナは、名字が入力されていても名前が入力されていなければ登録できない" do
      end
      it "ユーザー本名のフリガナは、名前が入力されていても名字が入力されていなければ登録できない" do
      end
      it "ユーザー本名のフリガナは全角（ひらがな）で入力されていれば登録できない" do
      end
      it "ユーザー本名のフリガナは全角（漢字）で入力されていれば登録できない" do
      end
      it "ユーザー本名のフリガナは全角（英語）で入力されていれば登録できない" do
      end
      it "生年月日が空だと登録できない" do
      end
    end
  end
end