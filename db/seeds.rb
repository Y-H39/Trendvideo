User.create!(name:  "Example User",
             email: "example@domain.org",
             password:              "foobar",
             password_confirmation: "foobar")
12.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@domain.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
titles = [
  "伏黒甚爾",
  "青梅",
  "25時の情熱",
  "群青讃歌",
  "コント",
  "花の塔",
  "Tomorrow never knows",
  "青のすみか",
  "感電",
  "アイドル"
]
urls = [
  "https://youtu.be/gI9lbGJMFUI?si=V50PoEKK2FLd5d8t",
  "https://youtu.be/PWJzM6dnYFQ?si=JukeB6HDTtwewikO",
  "https://youtu.be/ODuMEKNXFWg?si=In2WE0geTGRs5hVi",
  "https://youtu.be/sgZjbk9eH6g?si=F5uxieTOLhwTiWP-",
  "https://youtu.be/pwTIeEb48hg?si=2vQttfaYaxk2sC9G",
  "https://youtu.be/WIKKyrGGaDk?si=LZbjSNUoQtur7zDP",
  "https://youtu.be/Nxwt_s1lM04?si=N0-YK2pofziT7-P-",
  "https://youtu.be/gcgKUcJKxIs?si=9MkPB2kXwhTLziKt",
  "https://youtu.be/UFQEttrn6CQ?si=6--aXw4iXgm6w_y9",
  "https://youtu.be/ZRtdQ81jPUQ?si=Gto4eZVU2XVuUADY"
]
tag_lists = [
  "呪術廻戦,お笑い芸人",
  "クリープハイプ,バンド,MV",
  "ニーゴ,プロセカ,MV",
  "Eve,プロセカ,MV",
  "サンドウィッチマン,お笑い芸人",
  "リコリコ,ED",
  "ミスチル,バンド,MV",
  "キタニタツヤ,呪術廻戦,OP",
  "米津玄師,MV",
  "YOASOBI,推しの子,MV"
]
10.times do |n|
  user = User.order(:created_at).find(n+1)
  title = titles[n]
  url = urls[n]
  comment = Faker::Lorem.sentence(word_count: 3)
  tag_list = tag_lists[n]
  user.posts.create!(title: title, url: url, comment: comment, tag_list: tag_list)

  users = User.order(:created_at).take(n+3)
  post = Post.find(n+1)
  users.each { |user| user.favorites.create!(user_id: user.id, post_id: post.id) }
end

# ゲストユーザー
guest_user = User.guest
guest_titles = [
  "初心LOVE",
  "FEARLESS",
  "アンダーキッズ"
]
guest_urls = [
  "https://youtu.be/qNrRnnG8glY?si=Cb25mumJ9faqlZB4",
  "https://youtu.be/DiGnWwgLAfE?si=Bmh_gyQH2tOOVA4h",
  "https://youtu.be/TBoBfT-_sfM?si=Qgd888185ov200x9"
]
guest_tag_lists = [
  "なにわ男子,MV,ゲスト",
  "ルセラ,MV,ゲスト",
  "ツユ,MV,ゲスト"
]
3.times do |n|
  post = guest_user.posts.create!(
    title: guest_titles[n],
    url: guest_urls[n],
    comment: Faker::Lorem.sentence(word_count: 3),
    tag_list: guest_tag_lists[n]
  )

  users = User.order(:created_at).take(n+3)
  users.each { |user| user.favorites.create!(user_id: guest_user.id, post_id: post.id) }
  target_post = Post.where.not(user_id: guest_user.id).order(:created_at).find(n+1)
  guest_user.favorites.create!(user_id: guest_user.id, post_id: target_post.id)
end
