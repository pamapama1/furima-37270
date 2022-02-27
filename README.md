# usersテーブル
|Colum             |  Type|                  Options|
|------------------|------|-------------------------|
|nickname          |string|null:false , unique: true|
|email             |string|null:false               |
|password          |string|null:false               |
|first_name        |string|null:false               |
|second_name       |string|null:false               |
|first_name_kana   |string|null:false               |
|second_name_kana  |string|null:false               |
|birthday          |string|null:false               |

- has_many :items
- belongs_to :order

# itemsテーブル
|Colum             |      Type|                       Options|
|------------------|----------|------------------------------|
|name              |string    |null:false                    |
|description       |text      |null:false                    |
|price             |integer   |null:false                    |
|user              |references|null:false , foreign_key: true|

- belongs_to :order
- belongs_to :user

# ordersテーブル
|Colum             |      Type|                       Options|
|------------------|----------|------------------------------|
|price             |string    |null:false                    |
|post_code         |string    |null:false                    |
|municipalities    |string    |null:false                    |
|address           |string    |null:false                    |
|building          |string    |                              |
|number            |integer   |null:false                    |

belongs_to :user
belongs_to :item