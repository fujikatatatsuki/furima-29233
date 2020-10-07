## usersテーブル

| Column                      | Type   | Options     |
|-----------------------------|--------|-------------|
| nickname                    | string | null: false |
| email                       | string | null: false |
| encrypted_password          | string | null: false |
| full_width_family_name      | string | null: false |
| full_width_name             | string | null: false |
| full_width_kana_family_name | string | null: false |
| full_width_kana_name        | string | null: false |
| birthday                    | date   | null: false |

### Association
has_many :items
has_many :orders


## itemsテーブル

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
has_one :order
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to_active_hash :categories
belongs_to_active_hash :statuses
belongs_to_active_hash :delivery_fees
belongs_to_active_hash :shipping_regions
belongs_to_active_hash :shipping_days


## ordersテーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :address


## addressesテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| postal_code        | string     | null: false                    |
| shipping_region_id | integer    | null: false                    |
| city               | string     | null: false                    |
| block_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| shopping           | references | null: false, foreign_key: true |

### Association
belongs_to :order
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to_active_hash :shipping_regions
