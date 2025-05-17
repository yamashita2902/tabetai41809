# TABETAI

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

##  実装予定の機能

今後、以下のような機能の追加を予定しています。

###  フィードバック機能（写真投稿）

- ユーザーが提案された内容の「結果」を写真で投稿できる機能を追加。
- 写真と簡単なコメントを投稿し、履歴として蓄積。
- 他ユーザーへの共有（オプション）や、振り返りとしても活用可能。

###  スワイプ式レコメンド機能

- たまったデータをもとに、マッチングアプリのようなUIで提案をスワイプ形式に。
  - 例：左右スワイプで「あり」「なし」の評価を記録。
- より直感的にユーザーの好みに応じた提案が可能に。

###  ユーザー好みの分析機能

- スワイプ履歴や投稿写真をもとにユーザーの傾向を分析。
- より精度の高いレコメンドの実現へ。
- 将来的には、**ユーザーごとの「提案傾向」可視化**なども検討。

---

このように、ユーザーの行動データを活用したUX向上を段階的に進めていく計画です。


データベース設計
※ER図
https://gyazo.com/25873b17cb7bd599a27bfcf7da16fbd3



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
[※画面遷移図](https://gyazo.com/7dc9b30cdd94569c9a6881b1c159d715)

開発環境
フロントエンド：HTML / CSS / JavaScript

バックエンド：Ruby on Rails

データベース：MySQL

API連携：OpenAI API

バージョン管理：GitHub

##  ローカルでの動作方法

以下の手順でローカル環境にアプリをセットアップできます。

```bash
# 1. リポジトリをクローン
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name

# 2. 必要なパッケージをインストール（例: Ruby on Rails）
bundle install
yarn install

# 3. データベースを作成・マイグレーション
rails db:create
rails db:migrate

# 4. サーバーを起動
rails server
```

ブラウザで http://localhost:3000 にアクセスしてください。



制作時間	10時間