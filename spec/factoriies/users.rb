FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname                   {gimei.kanji}
    email                      {Faker::Internet.free_email}
    password                   {Faker::Internet.password(min_length: 6)}
    encrypted_password         {password}
    full_width_family_name     {gimei.last.kanji}
    full_width_name            {gimei.first.kanji}
    full_width_kana_family_name{gimei.last.katakana}
    full_width_kana_name       {gimei.first.katakana}
    date                       {1995-02-14}
  end
end