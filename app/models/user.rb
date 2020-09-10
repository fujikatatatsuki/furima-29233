class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # - ニックネームが必須であること
  validates :nickname, presence: true

  # - メールアドレスが必須であること
  # - メールアドレスが一意性であること
  # - メールアドレスは@を含む必要があること
  VALID_EMAIL_REGEX = /@/.freeze
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  # - パスワードが必須であること
  # - パスワードは6文字以上であること
  # - パスワードは半角英数字混合であること
  # - パスワードは確認用を含めて2回入力すること
  VALID_PASSWORD_REGEX = /[a-z\d{6,}]/i.freeze
  validates :encrypted_password, presence: true, format: { with: VALID_PASSWORD_REGEX }

  validates :encrypted_password_confirmation, presence: true, format: { with: VALID_PASSWORD_REGEX }

  # - ユーザー本名が、名字と名前がそれぞれ必須であること
  # - ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
  VALID_NAME_REGEX = /[ぁ-んァ-ン一-龥]/.freeze
  validates :full_width_family_name, presence: true, format: {with: VALID_NAME_REGEX }

  validates :full_width_name, presence: true, format: {with: VALID_NAME_REGEX }

  # - ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること
  # - ユーザー本名のフリガナは全角（カタカナ）で入力させること
  VALID_KANA_NAME_REGEX = /[ァ-ン]/.freeze
  validates :full_width_kana_family_name, presence: true, format: {with: VALID_KANA_NAME_REGEX }
  validates :full_width_kana_name, presence: true, format: {with: VALID_KANA_NAME_REGEX }
    
  # - 生年月日が必須であること
  validates :date, presence: true
end
