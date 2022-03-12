# usersテーブル
|Colum             |  Type|                  Options|
|------------------|------|-------------------------|
|nickname          |string|null:false               |
|email             |string|null:false ,unique: true |
|encrypted_password|string|null:false               |
|first_name        |string|null:false               |
|second_name       |string|null:false               |
|first_name_kana   |string|null:false               |
|second_name_kana  |string|null:false               |
|birthday          |date  |null:false               |

- has_many :items
- has_many :orders

# itemsテーブル
|Colum             |      Type|                       Options|
|------------------|----------|------------------------------|
|name              |string    |null:false                    |
|category_id       |integer   |null:false                    |
|status_id         |integer   |null:false                    |
|delivery_charge_id|integer   |null:false                    |
|location_id       |integer   |null:false                    |
|delivery_date_id  |integer   |null:false                    |
|description       |text      |null:false                    |
|price             |integer   |null:false                    |
|user              |references|null:false , foreign_key: true|

- belongs_to :user
- has_one :order


# addressesテーブル
|Colum             |      Type|                       Options|
|------------------|----------|------------------------------|
|post_code         |string    |null:false                    |
|municipalities    |string    |null:false                    |
|location_id       |integer   |null:false                    |
|address           |string    |null:false                    |
|building          |string    |                              |
|tel_number        |string    |null:false                    |
|order             |references|null:false , foreign_key: true|

- belongs_to :order

# ordersテーブル
|Colum             |      Type|                       Options|
|------------------|----------|------------------------------|
|item              |references|null:false , foreign_key: true|
|user              |references|null:false , foreign_key: true|

- belongs_to :user
- belongs_to :item
- has_one :address