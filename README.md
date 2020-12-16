# TOKYOシェア不動産
<br>
都内のシェアハウス物件の情報を掲載し、口コミを誰でも簡単に投稿できるサイトです。
<br>
<br>
<img width="1439" alt="スクリーンショット 2020-12-11 22 48 45" src="https://user-images.githubusercontent.com/67478234/102290079-9a7bc380-3f83-11eb-84f5-a83540c1fdd6.png">

<img width="1440" alt="スクリーンショット 2020-12-16 9 52 55" src="https://user-images.githubusercontent.com/67478234/102290670-d5322b80-3f84-11eb-880a-03da564d3ec6.png">

下記ページで公開中です。

<https://share-house-app.herokuapp.com/>

## アプリ概要
都内のシェアハウス物件を簡単に、シェアハウスに対するリアルな評価を参考にしながら検索できるアプリです。

- 都内にあるシェアハウスを検索できる
- 内覧に行ったことがある物件や以前住んでいた物件の口コミを点数付きで投稿する機能を実装
- 気になる物件をマイページで管理できる機能を実装

Ruby on Railsで制作しました。

作成した背景や想いなど、より詳細な情報は下記をご覧ください。  
[ポートフォリオ解説](https://qiita.com/nozomi_nozomi/items/b2597deae4b246131926)

## 機能
- 口コミ投稿・評価機能：　内覧・入居の両面、5段階で物件の評価を行えます。
- マイページ機能：行った物件(口コミを投稿した店舗)、保存した物件を一覧で確認できます。
- 物件検索機能(エリア)：物件があるエリアを軸に店舗を検索できます。また、入力したキーワードに合致する物件をあいまい検索できます。
- 物件管理機能：物件の所在地を地図で確認できます。
- 管理者権限機能：管理者のみ物件情報の登録・編集が許可されている仕様です。

## 使い方
### 物件検索
1. トップページの検索ボックスに任意のエリア名を入力 orエリアをボタンで選択。  
2. 検索結果一覧画面にて、家賃順、駅からの距離順、保存済数順で並べ替え可能。
### 口コミ投稿
1. 画面右上の「ログイン」ボタンをクリック
2. テストユーザーで簡単ログイン（※アカウント登録せずに機能を試したい方は こちらをクリック）
3. 任意の　物件ページに移動→口コミページ→口コミを投稿するをクリック
4. 評価等を入力して投稿→点数が反映される

## ローカル環境へのインストール方法
※Railsの場合
```
$ git clone https://github.com/nakamitsu-nozomi/share_house_app.git
$ cd  share_house_app
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
```
## 設計資料
### ワイヤーフレーム
- [ワイヤーフレーム](https://docs.google.com/presentation/d/e/2PACX-1vT_lBbLsrMqpv9SP1rTxUvZdFfE1SE6p9o9CukJoIlDqscCPQ-ujpDFPLk8e8eSBQ/pub?start=false&loop=false&delayms=3000)
### DB設計
- [テーブル設計](https://docs.google.com/spreadsheets/d/e/2PACX-1vTCacMTAT-RYPIAOvUf-YDRqKEMzctr6HnJMvad6qyuywFEgXoeTDE8gse32h7NBA/pubhtml)
- [ER図](https://viewer.diagrams.net/?highlight=0000ff&edit=_blank&layers=1&nav=1#G1tUVdbjg_RfHk-7kIsfbCQhsMx-Ep4Cgl)


## その他
現在も開発を継続しており、順次実装予定です。 
### 追加予定機能
- 検索機能の複雑化
- 部屋の家具情報ページの追加
- 物件画像を複数投稿、複数表示
-  物件投稿者へのお問い合わせ機能
- rspecを使ったテストコード
-  レスポンシブ対応
-  管理者画面で口コミ集計結果を表示
- AWSにデプロイ
 
実装予定の機能はtrelloよりご確認いただけます。  
[trello](https://trello.com/b/Cdp4Es2l/%E3%82%B7%E3%82%A7%E3%82%A2%E3%83%8F%E3%82%A6%E3%82%B9%E6%A4%9C%E7%B4%A2%E3%82%B5%E3%82%A4%E3%83%88)



## 作者
[：Twitter](https://twitter.com/engneer_louis)  
mail to: [exnnss0131@gmail.com](exnnss0131@gmail.com)
