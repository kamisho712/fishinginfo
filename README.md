# アプリケーション名
Fishinginfo

# アプリケーション概要
釣り好きのユーザーが釣果情報を共有でき、他のユーザーとコミュニケーションをとることができる。

# URL

# テスト用アカウント
* Basic認証パスワード：4869
* Basic認証ID：admin
### ユーザー1
* メールアドレス：test@test
* パスワード：111aaa
### ユーザー2
* メールアドレス：test2@test
* パスワード：111aaa

# 利用方法
## ユーザー登録
1. トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う。
## 釣果投稿
1. トップページ（一覧ページ）のヘッダーからログインを行う。
2. トップページ（一覧ページ）のヘッダーから必須項目・任意項目を入力し釣果投稿を行う。
## コメント機能
1. 釣果詳細ページのコメント入力フォームからコメントを入力し投稿する。
## フォロー機能
1. 他のユーザーのマイページのフォローボタンを押しフォローする。
## メッセージ機能
1. 他のユーザーのマイページのDMボタンを押し入力フォームにメッセージを入力送信する。

# アプリケーションを作成した背景
釣りが趣味の友人に課題をヒアリングし、「穴場の釣り場がわからない」という課題を抱えていることが判明した。課題を分析した結果、「穴場の釣り場は仲の良い釣り人同士でしか共有されていない」ということが真因であると仮説を立てた。同様の問題を抱えている方も多いと推測し、真因を解決するために、釣果を共有しユーザー同士のコミュニケーションを促進できるSNSアプリケーションを開発することにした。

# 洗い出した要件
[要件定義シート](https://docs.google.com/spreadsheets/d/1XP_kJ7uWtDX_mxNP-zFsKy2U-01HH096lBHlkEpPwXc/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明
実装後随時追加

# 実装予定の機能
* ユーザー管理機能
* 釣果投稿機能
* コメント機能
* フォロー機能
* メッセージ機能

# テーブル設計
## usersテーブル
|Column              |Type       |Options                    |
|--------------------|-----------|---------------------------|
|nickname            |string     |null: false, unique: true  |
|email               |string     |null: false, unique: true  |
|encrypted_password  |string     |null: false                |
### Association
- has_many :catches
- has_many :comments
- has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
- has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
- has_many :following_user, through: :follower, source: :followed
- has_many :follower_user, through: :followed, source: :follower
- has_many :room_users, dependent: :destroy
- has_many :messages, dependent: :destroy

## catchesテーブル
|Column         |Type       |Options                        |
|---------------|-----------|-------------------------------|
|aria           |integer    |null: false                    |
|detail_area    |string     |                               |
|fish_type      |string     |                               |
|fish_catch     |string     |                               |
|date and time  |string     |                               |
|comment        |text       |                               |
|user           |references |null: false, foreign_key:true  |
### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
|Column   |Type        |Options                        |
|---------|------------|-------------------------------|
|comment  |string      |null: false                    |
|user     |references  |null: false, foreign_key:true  |
|catch    |references  |null: false, foreign_key:true  |
### Association
- belongs_to :catch
- belongs_to :user

## relationshipsテーブル
|Column    |Type        |Options                        |
|----------|------------|-------------------------------|
|follower  |references  |null: false, foreign_key:true  |
|followed  |references  |null: false, foreign_key:true  |
### Association
- belongs_to :follower, class_name: "User"
- belongs_to :followed, class_name: "User"

## room_usersテーブル
|Column  |Type        |Options                        |
|--------|------------|-------------------------------|
|user    |references  |null: false, foreign_key:true  |
|room    |references  |null: false, foreign_key:true  |
### Association
- belongs_to :user
- belongs_to :room

## roomsテーブル
|Column  |Type        |Options                        |
|--------|------------|-------------------------------|
|user    |references  |null: false, foreign_key:true  |
### Association
- has_many :room_users, dependent: :destroy
- has_many :messages, dependent: :destroy

## messagesテーブル
|Column   |Type        |Options                        |
|---------|------------|-------------------------------|
|user     |references  |null: false, foreign_key:true  |
|room     |references  |null: false, foreign_key:true  |
|message  |text        |null: false                    |
### Association
- has_many :room_users, dependent: :destroy
- has_many :messages, dependent: :destroy

# DB設計
![ERD_fishinginfo](https://user-images.githubusercontent.com/108621604/204153516-71ca09d0-1e96-49d1-b469-15fcce84c903.png)

# 画面遷移図
![画面遷移図_fishinginfo](https://user-images.githubusercontent.com/108621604/204153535-42b34fd5-4eb2-4a83-89f0-0dd6fe5ca9f9.png)

# 開発環境
* フロントエンド
* バックエンド
* インフラ
* テスト
* テキストエディタ
* タスク管理

# ローカルでの動作確認
% git clone https://xxxxx.xxxx/xxxx  
% cd xxxxxx  
% bundle install  
% yarn install  


# 工夫したポイント