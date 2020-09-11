require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    # 何かしらの処理
  end

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録が成功する場合' do
      it "ニックネームが必須であること" do
      end
      it "メールアドレスが必須であること" do
      end
      it "メールアドレスが一意性であること" do
      end
      it "メールアドレスは@を含む必要があること" do
      end
      it "パスワードが必須であること" do
      end
      it "パスワードは6文字以上であること" do
      end
      it "パスワードは半角英数字混合であること" do
      end
      it "パスワードは確認用を含めて2回入力すること" do
      end
      it "ユーザー本名が、名字と名前がそれぞれ必須であること" do
      end
      it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
      end
      it "ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること" do
      end
      it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
      end
      it "生年月日が必須であること" do
      end
    end
    context '新規登録が失敗する場合' do
      it "ニックネームが空だと登録できない" do
      end
      it "メールアドレスが空だと登録できない" do
      end
      it "メールアドレスが重複（一意性）していると登録できない" do
      end
      it "メールアドレスに@を含まないと登録できない" do
      end
      it "パスワードが空だと登録できない" do
      end
      it "パスワードは6文字以下であると登録できない" do
      end
      it "パスワードが半角英数字混合でないと登録できない" do
      end
      it "パスワードは確認用を含めて1回しか入力していないと登録できない" do
      end
      it "ユーザー本名が、名字と名前がそれぞれ必須であること" do
      end
      it "ユーザー本名は空だと登録できない" do
      end
      it "ユーザー本名は英語だと登録できない" do
      end
      it "ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること" do
      end
      it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
      end
      it "生年月日が空だと登録できない" do
      end
    end
  end
end


  # # - ニックネームが必須であること
  # validates :nickname, presence: true

  # # - メールアドレスが必須であること デフォルト
  # # - メールアドレスが一意性であること デフォルト
  # # - メールアドレスは@を含む必要があること デフォルト

  # # - パスワードが必須であること デフォルト
  # # - パスワードは6文字以上であること
  # # - パスワードは半角英数字混合であること
  # # - パスワードは確認用を含めて2回入力すること デフォルト
  # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze
  # validates :password, format: { with: VALID_PASSWORD_REGEX }

  # # - ユーザー本名が、名字と名前がそれぞれ必須であること
  # # - ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
  # VALID_NAME_REGEX = /[ぁ-んァ-ン一-龥]/.freeze
  # validates :full_width_family_name, presence: true, format: {with: VALID_NAME_REGEX }

  # validates :full_width_name, presence: true, format: {with: VALID_NAME_REGEX }

  # # - ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること
  # # - ユーザー本名のフリガナは全角（カタカナ）で入力させること
  # VALID_KANA_NAME_REGEX = /[ァ-ン]/.freeze
  # validates :full_width_kana_family_name, presence: true, format: {with: VALID_KANA_NAME_REGEX }
  # validates :full_width_kana_name, presence: true, format: {with: VALID_KANA_NAME_REGEX }

  # # - 生年月日が必須であること
  # validates :birthday, presence: true