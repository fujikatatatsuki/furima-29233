class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  # - 共通で入力必須のバリテーションを設定
  with_options presence: true do
    # - ニックネームが必須であること
    validates :nickname

    # - ユーザー本名が、名字と名前がそれぞれ必須であること
    # - ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
    VALID_NAME_REGEX = /[ぁ-んァ-ン一-龥]/.freeze
    validates :full_width_family_name, format: { with: VALID_NAME_REGEX }

    validates :full_width_name, format: { with: VALID_NAME_REGEX }

    # - ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること
    # - ユーザー本名のフリガナは全角（カタカナ）で入力させること
    VALID_KANA_NAME_REGEX = /[ァ-ン]/.freeze
    validates :full_width_kana_family_name, format: { with: VALID_KANA_NAME_REGEX }
    validates :full_width_kana_name, format: {with: VALID_KANA_NAME_REGEX }

    # - 生年月日が必須であること
    validates :birthday
  end
  # - メールアドレスが必須であること デフォルト
  # - メールアドレスが一意性であること デフォルト
  # - メールアドレスは@を含む必要があること デフォルト

  # - パスワードが必須であること デフォルト
  # - パスワードは6文字以上であること
  # - パスワードは半角英数字混合であること
  # - パスワードは確認用を含めて2回入力すること デフォルト
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
end
