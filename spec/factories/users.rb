FactoryBot.define do
  factory :user do
    nickname                   { 'フリマ太朗' }
    email                      { Faker::Internet.free_email }
    password                   { '12345q' }
    password_confirmation      { password }
    full_width_family_name     { '山田' }
    full_width_name            { '太朗' }
    full_width_kana_family_name { 'ヤマダ' }
    full_width_kana_name       { 'タロウ' }
    birthday                   { '1995-04-01' }
  end
end
