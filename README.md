## users
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| gender_id          | integer | null: false |
| birthday           | date   | null: false |
| postal_code        | string | null: false |
| prefecture_id      | integer | null: false |
| city               | string | null: false |
| street_address	   | string | null: false |
| building           | string |             |
- has_many 
- has_many 

## meals
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| explanation        | text   | null: false |
| price              | integer | null: false |
| user               | references | null: false, foreign_key: true|
| category_id        | integer | null: false |
| prefecture_id      | integer | null: false |

-

## favorites
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | references | null: false, foreign_key: true|
| meal               | references | null: false, foreign_key: true|
- belongs_to :user
- belongs_to :meal
- has_one :

## questions
| Column                      | Type   | Options     |
| --------------------------- | ------ | ----------- |
|
- belongs_to :
