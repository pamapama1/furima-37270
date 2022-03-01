# usersテーブル
|Colum             |  Type|                  Options|
|------------------|------|-------------------------|
|nickname          |string|null:false               |
|email             |string|null:false ,unique: true |
|password          |string|null:false               |
|first_name        |string|null:false               |
|second_name       |string|null:false               |
|first_name_kana   |string|null:false               |
|second_name_kana  |string|null:false               |
|birthday          |date  |null:false               |

- has_many :items
- has_many :order
- belongs_to :address

# itemsテーブル
|Colum             |      Type|                       Options|
|------------------|----------|------------------------------|
|name              |string    |null:false                    |
|category          |string    |null:false                    |
|status            |string    |null:false                    |
|delivery_charge   |string    |null:false                    |
|location          |string    |null:false                    |
|day               |string    |null:false                    |
|description       |text      |null:false                    |
|price             |integer   |null:false                    |
|user              |references|null:false , foreign_key: true|

- belongs_to :order
- belongs_to :user
- belongs_to :address


# addressesテーブル
|Colum             |      Type|                       Options|
|------------------|----------|------------------------------|
|post_code         |string    |null:false                    |
|municipalities    |string    |null:false                    |
|address           |string    |null:false                    |
|building          |string    |                              |
|tel_number        |integer   |null:false                    |

- belongs_to :user
- belongs_to :item
- belongs_to :order

# ordersテーブル
|Colum             |      Type|                       Options|
|------------------|----------|------------------------------|
|item              |references|null:false , foreign_key: true|
|user              |references|null:false , foreign_key: true|
|address           |references|null:false , foreign_key: true|

- has_many   :users
- belongs_to :item
- belongs_to :address
