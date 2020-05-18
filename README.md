# foodie share time
## -全国お取り寄せグルメ口コミサイト-
# 概要
## 搭載機能
### メッセージ・画像投稿機能  
- 閲覧：ログアウト状態でも可能。  
- 投稿：ログイン状態のみ可能。  
- 編集・削除：投稿者本人のみ可能。  
### ユーザー登録機能  
- ニックネーム、ユーザーの希望アイコン画像（任意）、Emailアドレス、パスワードを入力し登録。  
### カテゴリー機能  
- 口コミ投稿時にカテゴリー４種類から選択。  
- カテゴリー毎、口コミ投稿の閲覧が可能。  
### コメント機能  
- 閲覧：ログアウト状態でも可能。  
- 投稿：ログイン状態のみ可能。  
### お気に入り機能  
- 投稿のお気に入り登録・閲覧にはログイン状態のみ可能。  
## 接続先情報
### URL：https://foodie-time.herokuapp.com/  
### テスト用アカウント  
#### Email：test1@com  
#### password：tech1111  
### 操作方法  
##### ログイン：サイト上部右から２番目のログインボタン押下→上記のテスト用アカウント入力→ログイン  
#####  (ログインできない場合→サイト上部右端の新規登録ボタン押下→登録)  
#### 投稿方法：
##### ログイン後、サイト上部右端の投稿するボタン押下→カテゴリー選択→ファイル選択ボタン押下し画像を選択  
##### →メッセージを入力→SENDボタン押下→投稿完了  
#### 閲覧方法：
##### サイト上部左端の口コミ一覧ページボタンを押下→投稿一覧が表示  
##### 投稿一覧ページ左側のカテゴリーの一覧から選択→カテゴリー毎の投稿が表示  
##### 各投稿の下部の詳細ボタン押下→コメント・お気に入りが可能  
##### 各投稿の下部編集ボタン・削除ボタンは投稿者本人のみ表示される  
## 制作背景
- 基礎、応用カリキュラムの学びを基盤にした機能を搭載し制作をすることで、  
スキルを定着させ、併行し、現段階での課題を明確化する為。  
- 新型コロナウイルス感染拡大により、自粛を要し  
社会や人々への影響としてはマイナス要素が多いと感じ、  
プラス要素に繋がるような制作物を望んでいた。  
”おうちでの楽しみ・喜び”にフォーカスをあてたとき、  
「お取り寄せグルメ」×「口コミ」による  
食から得られる幸福感が増すとともに  
さらには、口コミにより食品業界の経済へプラスの変化（支援）を望めると考えた為。  
## DEMO
### 当サイトのイメージ画像
## 工夫したポイント
- 初めてサイトを見た人にも、トップページにてサイトの概要が解りやすく、  
新規登録/ログイン〜投稿〜閲覧にかけて、活用しやすいファーマットであることを意識しました。  
- 写真と口コミが際立つように、ビューは全体的にシンプル且つ、  
食欲が増す暖色や、柔らかい色味を使用しました。
## 課題
- 例外処理やガード節が不十分なので、利用する方の目線に立ち、  
より安全に安心してサイトの利用ができるように改善していきます。  
合わせて、
- マイページにて、お気に入り登録した投稿一覧が確認できたり、  
フォロー機能を搭載することで、  
サイト利用者間のつながりを持てるよう、改善いたします。
- 検索機能やタグ付け機能、ランキング表示を搭載することで、  
利用する方が望んだ食品を見つけやすく、  
口コミを元に"お取り寄せしたい"という想いに  
繋がるようなサイトにしていきたいと考えております。

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique:true|
|password|string|null: false|
|image|string|

### Association
- has_many :messages
- has_many :comments
- has_many :likes
- has_many :liked_messages, through: :likes, source: :message
- validates :name, presence: true, uniqueness: true

## categories テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :messages

## messages テーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|image|string|null: false|
|user|references|foreign_key: true|
|category|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- has_many :comments
- has_many :likes
- has_many :liked_users, through: :likes, source: :user
- validates :content, presence: true, unless: :image?

## comments テーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|user_id|integer|
|message_id|integer|

### Association
- belongs_to :user
- belongs_to :message

## likes テーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|message|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :message
- validates_uniqueness_of :message_id, scope: :user_id

