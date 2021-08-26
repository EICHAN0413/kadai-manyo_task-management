

# テーブルスキーマー

## Taskテーブル

|  カラム名  |  データ型  |
| --------- | -------- |  
|  title    |  string  |
|  content  |  text    |


# Herokuへのデプロイ手順

## コミットをする
git commit -m "コミットメッセージ例"

## Herokuに新しいアプリケーションを作成
$ heroku create を行う
URLは毎回異なる

## Heroku buildpackを追加
Heroku buildpackとは、作成したアプリケーションをHeroku上でコンパイルするためのもの.
基本的には、Herokuがソースコードの開発言語に合わせて自動検出し、buildpackがインストールされます。しかし、それだけでは不十分な場合や追加でbuildpackが必要な場合には、
次のようにコマンドを実行してbuildpackを追加する。
- $ heroku buildpacks:set heroku/ruby
- $ heroku buildpacks:add --index 1 heroku/nodejs

## Herokuへデプロイ
 $ git push heroku master

## データベースへの移行
Herokuデータベースの作成は自動で行われますが、マイグレーション（テーブル作成）は手動で実行する必要があります。
$ heroku run rails db:migrate

## アプリケーションにアクセスする
Herokuアプリのアドレスは https://アプリ名.herokuapp.com/ のように設定される
アクセスする。

