TABETAI
アプリケーション概要
「TABETAI」は、ユーザーの気分や希望条件に応じて、最適な飲食店を提案するアプリケーションです。
簡単な質問に答えるだけで、今食べたいものが見つかります。

1人で外食する際「物を決められない」を解決したい。
その人の「食べたい」を見つけるアプリです。

テスト用アカウント
email：a@gmail.com

password：123456a

利用方法
トップページから「質問に答える」ボタンをクリックします。

10個の質問に答えて、今の気分をアプリに伝えます。

回答に基づき、最適な飲食店を3つ提案します。

気になるお店をクリックして、詳細情報を確認できます。

アプリケーションを作成した背景
日々の生活の中で「何を食べるか決められない」という悩みを抱えている人が多くいます。
このアプリは、そういった人たちの「ご飯選びの手間」を減らし、よりスムーズに食の選択ができるようにするために開発しました。

実装した機能とその説明
質問機能
10〜20個の4択の質問を出題し、その回答に基づいて飲食店を絞り込みます。

飲食店レコメンド機能
回答結果から、OpenAI APIを活用して飲食店を3つ提案します。

マークダウン形式のレスポンス表示
提案されたお店の紹介文はマークダウン形式で整形され、視認性を向上させています。

※各機能の画像やGIFはGyazo/GyazoGIFにて撮影・添付予定です。

実装予定の機能
ユーザーごとのお気に入り登録機能

スワイプ式の直感的レコメンド機能

ルーレット型のランダム提案機能

データベース設計
※ER図（Gyazoリンクなど）を後ほど貼り付けてください。



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
- has_many :meals
- has_many :favorites
- has_many :favorite_meals, through: :favorites, source: :meal

## meals
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| explanation        | text   | null: false |
| price              | integer | null: false |
| user               | references | null: false, foreign_key: true|
| category_id        | integer | null: false |
| prefecture_id      | integer | null: false |

- belongs_to :user
- has_many :favorites
- has_many :favorited_by_users, through: :favorites, source: :user

## favorites
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | references | null: false, foreign_key: true|
| meal               | references | null: false, foreign_key: true|
- belongs_to :user
- belongs_to :meal


## questions
| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| content | string | null: false |
- has_many :question_options
- has_many :user_answers

## question_options
| Column       | Type       | Options                         |
| ------------ | ---------- | ------------------------------- |
| content      | string     | null: false                     |
| question     | references | null: false, foreign_key: true |
| option_code | string     | null: false                     |
- belongs_to :question
- has_many :user_answers

## user_answers
| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| user             | references | null: false, foreign_key: true |
| question         | references | null: false, foreign_key: true |
| question_option  | references | null: false, foreign_key: true |
- belongs_to :user
- belongs_to :question
- belongs_to :question_option

画面遷移図
※画面遷移図（Gyazoリンクなど）を後ほど貼り付けてください。

開発環境
フロントエンド：HTML / CSS / JavaScript

バックエンド：Ruby on Rails

データベース：MySQL

API連携：OpenAI API

バージョン管理：GitHub