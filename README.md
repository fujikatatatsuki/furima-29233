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
has_one :address
extend ActiveHash::Associations::ActiveRecordExtensions
belong_to_active_hash :categories
belong_to_active_hash :statuses
belong_to_active_hash :delivery_fees
belong_to_active_hash :shipping_regions
belong_to_active_hash :shipping_days


## shoppingsテーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| product       | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :product
has_one :address


## addressesテーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| prefecture_id | integer    | null: false                    |
| postal_code   | string     | null: false                    |
| city          | string     | null: false                    |
| block_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| shopping      | references | null: false, foreign_key: true |

### Association
belongs_to :shopping
extend ActiveHash::Associations::ActiveRecordExtensions
belong_to_active_hash :prefectures
