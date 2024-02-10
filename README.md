# README

# The view
YouTube動画の投稿サイトとなります。  
いいね数に応じたランキングを表示いたします。  
レスポンシブ対応しております。  
<img width="1440" alt="スクリーンショット 2024-02-11 6 49 54" src="https://github.com/Y-H39/Trendvideo/assets/147930743/f2bb4c35-aa81-44df-b860-8ac40b0fe27d">

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
○ユーザー登録、ログイン機能、ゲストログイン機能   
<img width="258" alt="スクリーンショット 2024-02-11 7 11 15" src="https://github.com/Y-H39/Trendvideo/assets/147930743/e2318b07-c716-4957-a5fc-512c6eda89c0">

<img width="779" alt="スクリーンショット 2024-02-11 7 41 22" src="https://github.com/Y-H39/Trendvideo/assets/147930743/cb5f40ad-7c23-4029-802d-d86193e7c148">

<img width="785" alt="スクリーンショット 2024-02-11 7 41 59" src="https://github.com/Y-H39/Trendvideo/assets/147930743/b5fb6b3d-575f-41d9-89ca-91031d06b1a1">

○投稿機能  
→URLには埋め込みURLをご使用下さい。  
<img width="531" alt="スクリーンショット 2024-01-18 4 32 08" src="https://github.com/Y-H39/Trendvideo/assets/147930743/dc4b7fb3-2342-490b-bcb0-b2d1688d3beb">  

→タグは「,」区切りで複数作成が可能です。  
<img width="775" alt="スクリーンショット 2024-02-11 8 13 36" src="https://github.com/Y-H39/Trendvideo/assets/147930743/c801f39b-5e35-41c6-9756-94c65070f8f3">
<img width="1164" alt="スクリーンショット 2024-02-11 7 49 19" src="https://github.com/Y-H39/Trendvideo/assets/147930743/68528b4c-978c-4a98-81b2-32c795b798d2">

○いいね機能  
→いいねをクリック頂くとカウントが増え、再度クリック頂くと減ります。  
<img width="730" alt="スクリーンショット 2024-02-11 8 22 53" src="https://github.com/Y-H39/Trendvideo/assets/147930743/4220c7a6-5aef-4d2b-94c8-c8936d45ab29">

○ランキング機能  
→いいね数の上位10位までを週間/月間/全期間でランキングして表示いたします。  
<img width="757" alt="スクリーンショット 2024-02-11 8 27 01" src="https://github.com/Y-H39/Trendvideo/assets/147930743/dae692f5-fd60-4a4a-b912-bd88c7a4ab6a">
<img width="765" alt="スクリーンショット 2024-02-11 8 27 17" src="https://github.com/Y-H39/Trendvideo/assets/147930743/d987dae4-ccdf-4059-bcf3-35e1c8673f8d">

→非ログイン時も確認することができます。　　
<img width="1440" alt="スクリーンショット 2024-02-11 8 29 00" src="https://github.com/Y-H39/Trendvideo/assets/147930743/18bde700-ac9b-4d0a-9470-f8766142f47a">

○プロフィール機能  
→Profileをクリック頂くとプロフィールページへ遷移いたします。  
<img width="195" alt="スクリーンショット 2024-02-11 8 30 43" src="https://github.com/Y-H39/Trendvideo/assets/147930743/4035929d-a606-4a2a-91c4-cbcebd9889df">

・投稿一覧  
<img width="1440" alt="スクリーンショット 2024-02-11 8 31 11" src="https://github.com/Y-H39/Trendvideo/assets/147930743/6a939961-e915-4904-893c-b824da947926">

・いいね一覧  
→タブ切り替えでいいね一覧ページを表示いたします。  
<img width="745" alt="スクリーンショット 2024-02-11 8 33 28" src="https://github.com/Y-H39/Trendvideo/assets/147930743/7e77bf4d-2a7e-4484-82c5-f0d30f62a712">

○タグ機能  
→タグをクリック頂くとタグで絞り込み検索が可能です。  
<img width="812" alt="スクリーンショット 2024-02-11 8 38 58" src="https://github.com/Y-H39/Trendvideo/assets/147930743/d33da04b-0079-4384-b8ea-13d71a72edf4">

→トップページ上部にタグの総数でランキングした人気タグリストを表示しております。  
<img width="1186" alt="スクリーンショット 2024-02-11 8 39 58" src="https://github.com/Y-H39/Trendvideo/assets/147930743/f43228d3-56d7-41f7-aad7-6f05b396242f">

○検索機能  
→入力して検索をクリック頂くとタイトルまたはタグで部分一致した投稿を表示いたします。  
<img width="807" alt="スクリーンショット 2024-02-11 8 40 42" src="https://github.com/Y-H39/Trendvideo/assets/147930743/d1481d6a-0541-4bef-be1d-7bb44ba05260">

# テスト  
・RSpec  
○単体テスト(model)  
○統合テスト(system)   

# ER図
![erd_page-0001](https://github.com/Y-H39/rank_app/assets/147930743/b8e58de5-f556-4b89-bcd0-41983be3c4f9)

# 今後の課題  
今回の開発ではあまり触れることができませんでしたが、  
今後はより積極的にJavaScript等を用いてWebサイトの動き付けをする等のより良いユーザー体験を意識したレイアウトにしていきたいです。  
