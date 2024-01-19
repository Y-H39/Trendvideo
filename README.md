# README

# The view
YouTube動画の投稿サイトとなります。  
いいね数に応じたランキングを表示いたします。  
レスポンシブ対応しております。  

![スクリーンショット 2024-01-20 5 24 30](https://github.com/Y-H39/Trendvideo/assets/147930743/e57298bf-c912-4328-b9a2-a92c32066289)  

# URL  
https://trendvideo.onrender.com

# 開発理由  
現在のYouTubeは、YouTube側が独自にピックアップした形での人気の動画しか調べられず、  
例えばユーザーのいいね数といった実際のデータに基づいたランキングは見ることができません。  
そんなきっかけから、いいね数によるランキングを実現する為本サイトを開発いたしました。  

# 使用技術
Ruby 3.2.2  
rails 7.0.4.3  
sqlite3 1.6.1  
puma 5.6.5  
rspec-rails 6.1.0  

# 機能一覧
・ユーザー登録、ログイン機能(devise)  
![スクリーンショット 2024-01-18 2 47 22](https://github.com/Y-H39/Trendvideo/assets/147930743/f1a6a910-7e89-4a76-9d2a-f3ad89b1c5e1)
![スクリーンショット 2024-01-18 2 47 32](https://github.com/Y-H39/Trendvideo/assets/147930743/af686446-31d6-4897-ad29-6d956179aeeb)

　⚪︎ゲストログイン機能  
![スクリーンショット 2024-01-18 4 05 38](https://github.com/Y-H39/Trendvideo/assets/147930743/0dc6ebdf-a76b-4633-acf2-e2f74842370e)

・投稿機能  
　→URLには埋め込みURLをご使用下さい。  

<img width="531" alt="スクリーンショット 2024-01-18 4 32 08" src="https://github.com/Y-H39/Trendvideo/assets/147930743/dc4b7fb3-2342-490b-bcb0-b2d1688d3beb">  

→タグは「,」区切りで複数作成が可能です。  

<img width="385" alt="スクリーンショット 2024-01-20 5 09 27" src="https://github.com/Y-H39/Trendvideo/assets/147930743/ea8d36a7-6169-464a-9179-56d3fdfb8b9f">  

![スクリーンショット 2024-01-20 5 09 44](https://github.com/Y-H39/Trendvideo/assets/147930743/7bae3126-ad6b-491d-b8e0-027940aa8c99)  

・いいね機能  
　→いいねをクリック頂くとカウントが増え、再度クリック頂くと減ります。  

<img width="109" alt="スクリーンショット 2024-01-18 4 17 48" src="https://github.com/Y-H39/Trendvideo/assets/147930743/618c5416-963f-4fdc-a35c-890e10ca84c2">  

<img width="784" alt="スクリーンショット 2024-01-18 4 10 24" src="https://github.com/Y-H39/Trendvideo/assets/147930743/9c91c0e7-4c79-4df0-b34d-b65317d3bd0a">  

　⚪︎ランキング機能  
 　　→いいね数上位10位までをランキングして表示いたします。
<img width="787" alt="スクリーンショット 2024-01-18 4 20 12" src="https://github.com/Y-H39/Trendvideo/assets/147930743/78651cbf-a1b6-4282-80af-2b57f1897bdf">　　

　　→非ログイン時も確認することができます。　　
<img width="773" alt="スクリーンショット 2024-01-18 5 06 33" src="https://github.com/Y-H39/Trendvideo/assets/147930743/4eca5f56-5750-4103-8693-5684e834b360">

・プロフィール機能  
　 →Profileをクリック頂くとプロフィールページへ遷移いたします。　　
<img width="175" alt="スクリーンショット 2024-01-18 4 36 15" src="https://github.com/Y-H39/Trendvideo/assets/147930743/aaa28b72-369f-4696-9dec-8df0f647e181">

  ⚪︎投稿一覧  
![スクリーンショット 2024-01-18 3 29 55](https://github.com/Y-H39/Trendvideo/assets/147930743/c94c0374-1c2e-4f5d-aad7-7c53e3bdd04c)

  ⚪︎いいね一覧  
    →タブ切り替えでいいね一覧ページを表示いたします。
![スクリーンショット 2024-01-18 4 56 01](https://github.com/Y-H39/Trendvideo/assets/147930743/9543d9c4-aa5b-4cdf-b409-0cf89acae5d7)

・タグ機能  
　　→タグをクリック頂くとタグで絞り込み検索が可能です。  

<img width="278" alt="スクリーンショット 2024-01-20 5 10 38" src="https://github.com/Y-H39/Trendvideo/assets/147930743/40f3b851-f4c2-4b53-9009-c0db5c2dd5cc">  

![スクリーンショット 2024-01-20 5 10 59](https://github.com/Y-H39/Trendvideo/assets/147930743/f14ffad5-76ba-4155-a8c0-9ea301b6dcbd)  

・検索機能(ransack)  
  →入力して検索をクリック頂くとタイトルまたはタグで部分一致した投稿を表示いたします。  

<img width="279" alt="スクリーンショット 2024-01-18 4 22 45" src="https://github.com/Y-H39/Trendvideo/assets/147930743/8aaee95a-9eee-4d99-9e42-ceadb53e6dc9">  

![スクリーンショット 2024-01-18 3 32 14](https://github.com/Y-H39/Trendvideo/assets/147930743/d2699f14-d072-42c2-9f19-7e7613ef5365)

# テスト  
・RSpec  
　⚪︎単体テスト(model)   
　⚪︎統合テスト(system)  

# ER図
![erd_page-0001](https://github.com/Y-H39/rank_app/assets/147930743/b8e58de5-f556-4b89-bcd0-41983be3c4f9)

# 今後の課題  
今回の開発ではあまり触れることができませんでしたが、  
今後はより積極的にJavaScriptを用いてWebサイトの動き付け等のユーザー体験を意識したレイアウトにしていきたいです。
