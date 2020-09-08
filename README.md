## usersテーブル

| Column                      | Type   | Options     |
|-----------------------------|--------|-------------|
| nickname                    | string | null: false |
| e_mail                      | string | null: false |
| password                    | string | null: false |
| password_confirmation       | string | null: false |
| full_width_family_name      | string | null: false |
| full_width_name             | string | null: false |
| full_width_kana_family_name | string | null: false |
| full_width_kana_name        | string | null: false |
| birthday                    | date   | null: false |

### Association
has_many :products
has_many :shoppings


## productsテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_fee_id    | integer    | null: false                    |
| shipping_region_id | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| selling_price      | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :shopping
extend ActiveHash::Associations::ActiveRecordExtensions
belong_to_active_hash :categories
belong_to_active_hash :statuses
belong_to_active_hash :delivery_fees
belong_to_active_hash :shipping_days


## shoppingsテーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| postal_code   | string     | null: false                    |
| prefecture-id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: true                     |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| product       | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :product
extend ActiveHash::Associations::ActiveRecordExtensions
belong_to_active_hash :prefectures


## prefecturesテーブル

| Column     | Type   | Options      |
|------------|--------|--------------|
| prefecture | string | null: false  |
