## usersテーブル

| Column                      | Type       | Options                        |
|-----------------------------|------------|--------------------------------|
| nickname                    | string     | null: false                    |
| e_mail                      | string     | null: false                    |
| password                    | string     | null: false                    |
| password_confirmation       | string     | null: false                    |
| full_width_family_name      | string     | null: false                    |
| full_width_name             | string     | null: false                    |
| full_width_kana_family_name | string     | null: false                    |
| full_width_kana_name        | string     | null: false                    |
| birthday_year_id            | references | null: false, foreign_key: true |
| birthday_month_id           | references | null: false, foreign_key: true |
| birthday_day_id             | references | null: false, foreign_key: true |
| product_id                  | references | null: false, foreign_key: true |
| shopping_id                 | references | null: false, foreign_key: true |

### Association
has_many :products
has_many :shoppings
extend ActiveHash::Associations::ActiveRecordExtensions
belong_to_active_hash :birthday_years
belong_to_active_hash :birthday_months
belong_to_active_hash :birthday_days


## birthday_yearsテーブル

| Column        | Type    | Options     |
|---------------|---------|-------------|
| birthday_year | integer | null: false |


## birthday_monthsテーブル

| Column         | Type    | Options     |
|----------------|---------|-------------|
| birthday_month | integer | null: false |


## birthday_daysテーブル

| Column       | Type    | Options     |
|--------------|---------|-------------|
| birthday_day | integer | null: false |


## productsテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| image            | string     | null: false                    |
| product          | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | references | null: false, foreign_key: true |
| status_id        | references | null: false, foreign_key: true |
| delivery_fee_id  | references | null: false, foreign_key: true |
| shipping_day_id  | references | null: false, foreign_key: true |
| selling_price    | integer    | null: false                    |
| sales_commission | integer    | null: false                    |
| sales_profit     | integer    | null: false, foreign_key: true |
| user_id          | references | null: false, foreign_key: true |

### Association
belongs_to :users
has_one :shoppings
extend ActiveHash::Associations::ActiveRecordExtensions
belong_to_active_hash :categories
belong_to_active_hash :statuses
belong_to_active_hash :delivery_fees
belong_to_active_hash :shipping_days


## categoriesテーブル

| Column   | Type    | Options     |
|----------|---------|-------------|
| category | string  | null: false |


## statusesテーブル

| Column | Type    | Options     |
|--------|---------|-------------|
| status | string  | null: false |


## delivery_feesテーブル

| Column       | Type    | Options     |
|--------------|---------|-------------|
| delivery_fee | string  | null: false |


## shipping_daysテーブル

| Column       | Type    | Options     |
|--------------|---------|-------------|
| shipping_day | string  | null: false |


## shoppingsテーブル

| Column                | Type       | Options                        |
|-----------------------|------------|--------------------------------|
| card_number           | integer    | null: false                    |
| expiration_date_month | integer    | null: false                    |
| expiration_date_year  | integer    | null: false                    |
| security_code         | integer    | null: false                    |
| postal_code           | string     | null: false                    |
| prefecture-id         | references | null: false, foreign_key: true |
| city                  | string     | null: false                    |
| address               | string     | null: false                    |
| building_name         | string     | null: true                     |
| phone_number          | string     | null: false                    |
| user_id               | references | null: false, foreign_key: true |
| product_id            | references | null: false, foreign_key: true |

### Association
belongs_to :users
belongs_to :products
extend ActiveHash::Associations::ActiveRecordExtensions
belong_to_active_hash :prefectures


## prefecturesテーブル

| Column      | Type    | Options     |
|-------------|---------|-------------|
| prefectures | string  | null: false |