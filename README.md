# AnimalBook  
https://animal-book.herokuapp.com/  


![AnimalBook](https://user-images.githubusercontent.com/52994356/64425689-67dbed80-d0e7-11e9-95cd-104d02e7b273.gif)

# Overview/概要
動物図鑑型写真投稿サービス  
動物図鑑形式の写真投稿Webアプリを作成しました。  
テーマは”まだ見ぬ動物との出会いを求めて”  

# Description/説明
 学生時代に旅行で、様々な動物と出会いそれを携帯のメモ帳に自分で動物図鑑として写真と詳細などを記録していました。動物が好きなのでいろんな動物の写真を撮る事が好きでした。Instagramでも動物専用アカウントをわざわざフォローしたりしていました。  
だから、動物好きが集まって情報交換をする動物に特化したInstagramみたいなものあったらいいな！使いたいな！と思って作りました！  
動物登録から、自分が出会った動物の写真と概要を投稿可能。出会った動物を図鑑形式でコレクションしたり、他の人の投稿をミタイ！機能でマイページに保存したり、動物好きと動物をシェアして情報共有をしたりと動物好きの動物好きの為のアプリです！  

# Usage/使用法
新規登録　→　投稿・マイページ作成可能。（googleログインも可※現在メアドのみです）  
投稿　　　→　写真をリサイズして好きなアップでシェアできます。  
コメント　→　投稿へのコメントや、情報の共有をできます。  
マイ図鑑　→　プロフィール作成して、いろんな人に見てもらいましょう。  
ミタイ　　→　自分がミタイを押した投稿をマイページに保存しておくことができます。  
ランキング→　ミタイが多い投稿の上位三つがトップページに表示されます。  

# User/利用者
動物好き　→　いろんな動物を見たい、シェアしたい。どこで会えるのか知りたい  
旅行好き　→　旅行先で出会った野生動物を共有したい。とりあえず写真載せてみて動物博士から詳細を教えてもらいたい。  

# Features/機能
・googleAPIを使ったログイン機能  
・ユーザーマイページ編集  
・画像投稿・編集・削除  
・コメント投稿・削除の非同期化  
・画像投稿時のトリミング機能  
・いいね（ミタイ）の非同期機能  

# Will/今後実装したい機能
・画像複数枚投稿  
・フォローフォロワー機能  
・レスポンシブ向上  
・投稿時に野生or非野生マークをつける  

# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|profile|text||
|spot|string||
|favorite|string||
|icon|string||
|provider|string||
|uid|string||
### Association
- has_many :posts, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :liked_posts, through: :likes, source: :post
- has_many :comments

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|animal|string|null: false|
|image|string|null: false|
|habitat|string|null: false|
|detail|text|null: false|
|user_id|integer|null: false, foreign_key: true|
###Association
- belongs_to :user
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|detail|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
###Association
- belongs_to :user
- belongs_to :post

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
###Association
- belongs_to :user
- belongs_to :post


# Author/作者
https://www.wantedly.com/users/102386324  

