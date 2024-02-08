user = FactoryBot.create(:user, name: "Example User", email: "example@domain.org", password: "foobar", password_confirmation: "foobar")
50.times do
  FactoryBot.create(:user)
end

post_data = [
  { title: "終わりなき旅", url: "https://youtu.be/QCiERL2m3Ss?si=kOnTgCgGDrriBtS2", tag_list: "ミスチル,バンド,MV"},
  { title: "祈り ～涙の軌道", url: "https://youtu.be/AmGE-npGJ_E?si=AWDECzABcUzLaNcq", tag_list: "ミスチル,バンド,MV"},
  { title: "Everything（it's you）", url: "https://youtu.be/ZMLdS2ZiI8w?si=R_cThXMUS0hcbdjs", tag_list: "ミスチル,バンド,MV"},
  { title: "シーソーゲーム 〜勇敢な恋の歌〜", url: "https://youtu.be/mOJIchNt3RY?si=2qRN5QvNwjgOabiX", tag_list: "ミスチル,バンド,MV"},
  { title: "CROSS ROAD", url: "https://youtu.be/C4zJfYA_ur8?si=dgus7DzCOMDmC3hl", tag_list: "ミスチル,バンド,MV"},
  { title: "Tomorrow never knows", url: "https://youtu.be/Nxwt_s1lM04?si=aRYJhiTNcDHi2XSL", tag_list: "ミスチル,バンド,MV"},
  { title: "youthful days", url: "https://youtu.be/l0n0hRasLw0?si=LDY-hXuMYehnKv6s", tag_list: "ミスチル,バンド,MV"},
  { title: "アイドル", url: "https://youtu.be/FEktA0Nmnjs?si=KdQsXx53CZKaJ_uE", tag_list: "YOASOBI,推しの子,高橋李依,MV"},
  { title: "春雷", url: "https://youtu.be/zkNzxsaCunU?si=7g88jSJdRVnDeqpn", tag_list: "米津玄師,MV"},
  { title: "orion", url: "https://youtu.be/lzAyrgSqeeE?si=gIG-ve7fk70p2DZH", tag_list: "米津玄師,MV"},
  { title: "Lemon", url: "https://youtu.be/SX_ViT4Ra7k?si=y_dZZcFFmZUJRGPb", tag_list: "米津玄師,MV"},
  { title: "KICKBACK", url: "https://youtu.be/dFlDRhvM4L0?si=iL1HUehkM3g6m2-a", tag_list: "米津玄師,チェンソーマン,OP"},
  { title: "KICKBACK", url: "https://youtu.be/M2cckDmNLMI?si=8tuZOzzfIedTmNv_", tag_list: "米津玄師,MV"},
  { title: "砂の惑星", url: "https://youtu.be/AS4q9yaWJkI?si=Pkyw9Ty-AM2s47Yu", tag_list: "米津玄師,MV"},
  { title: "マトリョシカ", url: "https://youtu.be/HOz-9FzIDf0?si=ahP26o6qYbBZtPHX", tag_list: "米津玄師,MV"},
  { title: "群青", url: "https://youtu.be/Y4nEEZwckuU?si=0J8fwXCmmo49tuJ4", tag_list: "YOASOBI,MV"},
  { title: "怪物", url: "https://youtu.be/dy90tA3TT1c?si=DD8Hw6l1nsmAMBDF", tag_list: "YOASOBI,MV"},
  { title: "祝福", url: "https://youtu.be/3eytpBOkOFA?si=oec8oBJG-8pj3Tzl", tag_list: "YOASOBI,MV"},
  { title: "三原色", url: "https://youtu.be/nhOhFOoURnE?si=gbF6m25ZlEDv3pXz", tag_list: "YOASOBI,MV"},
  { title: "ハルジオン", url: "https://youtu.be/kzdJkT4kp-A?si=iIrqmVOTwxVmMrfH", tag_list: "YOASOBI,MV"},
  { title: "勇者", url: "https://youtu.be/OIBODIPC_8Y?si=jAFcwGG1eHdSeIKk", tag_list: "YOASOBI,葬送のフリーレン,MV"},
  { title: "余裕", url: "https://youtu.be/aTLLemQpMN0?si=qDUFGQymhVsb8jL0", tag_list: "東京03,コント"},
  { title: "同窓会", url: "https://youtu.be/XfjTsex-C-Y?si=3kcoZwJ43OpyB-jE", tag_list: "東京03,コント"},
  { title: "二人の雰囲気", url: "https://youtu.be/i3eH57T0Xtg?si=bYzXhz03DcMXeZeF", tag_list: "東京03,コント"},
  { title: "市民の味方", url: "https://youtu.be/EV4_lSjgkzU?si=6G9jopNmZkL7CEM0", tag_list: "東京03,コント"},
  { title: "ステーキハウスにて", url: "https://youtu.be/ko8D-wq3rhc?si=IopMYAWJdsoxWKWa", tag_list: "東京03,コント"},
  { title: "スポーツジム", url: "https://youtu.be/1uX4_3goTsE?si=teri2CcJ3ob3GX8H", tag_list: "サンドウィッチマン,コント"},
  { title: "エステ", url: "https://youtu.be/-MDNIG8a3q4?si=33IP0bqiBIgJpsfm", tag_list: "サンドウィッチマン,コント"},
  { title: "写真館", url: "https://youtu.be/xh3eXv9gdxo?si=Fv5HUSewL_W1y1CG", tag_list: "サンドウィッチマン,コント"},
  { title: "蜂の巣駆除", url: "https://youtu.be/Gpy-8na4zSQ?si=Gz8-vSTvXqWRUNzK", tag_list: "サンドウィッチマン,コント"},
  { title: "カラオケ", url: "https://youtu.be/5kmyOfvucp8?si=5hNZ5eMelSpKj7Oz", tag_list: "サンドウィッチマン,コント"},
  { title: "五条悟を滅多刺しする伏黒甚爾", url: "https://youtu.be/gI9lbGJMFUI?si=yTIXy_l-fvdYG4bK", tag_list: "呪術廻戦,コント"},
  { title: "青梅", url: "https://youtu.be/PWJzM6dnYFQ?si=QKX9AisGkLZcQPrZ", tag_list: "クリープハイプ,バンド,MV"},
  { title: "25時の情熱", url: "https://youtu.be/ODuMEKNXFWg?si=MH_I_MqezVfN8v1K", tag_list: "ニーゴ,プロセカ,MV"},
  { title: "群青讃歌", url: "https://youtu.be/sgZjbk9eH6g?si=VppZ_f4XgJM2sl-3", tag_list: "Eve,プロセカ,MV"},
  { title: "花の塔", url: "https://youtu.be/WIKKyrGGaDk?si=5peK2SPGq8ayoUjq", tag_list: "リコリコ,ED"},
  { title: "innocent world", url: "https://youtu.be/rfVhsgCqG0I?si=e8oJ0jn4M0QrKDTj", tag_list: "ミスチル,バンド,MV"},
  { title: "青のすみか", url: "https://youtu.be/gcgKUcJKxIs?si=wOUn2Rm_kyxOVrh6", tag_list: "キタニタツヤ,呪術廻戦,OP"},
  { title: "感電", url: "https://youtu.be/UFQEttrn6CQ?si=ra-OTn4p_dq-oxoK", tag_list: "米津玄師,MV"},
  { title: "アイドル", url: "https://youtu.be/ZRtdQ81jPUQ?si=Gto4eZVU2XVuUADY", tag_list: "YOASOBI,推しの子,MV"}
]

40.times do |n|
  user = User.order(:created_at).find(n+1)
  post_info = post_data[n]
  user.posts.create!(
    title: post_info[:title],
    url: post_info[:url],
    comment: Faker::Lorem.sentence(word_count: 3),
    tag_list: post_info[:tag_list],
    created_at: Time.current - n.days
  )

  users = User.order(:created_at).take(n+4)
  post = Post.find(n+1)
  users.each { |u| u.favorites.create!(user_id: u.id, post_id: post.id) }
end

# ゲストユーザー
guest_user = User.guest
guest_post_data = [
  {
    title: "初心LOVE",
    url: "https://youtu.be/qNrRnnG8glY?si=Cb25mumJ9faqlZB4",
    tag_list: "なにわ男子,MV,ゲスト"
  },
  {
    title: "FEARLESS",
    url: "https://youtu.be/DiGnWwgLAfE?si=Bmh_gyQH2tOOVA4h",
    tag_list: "ルセラ,MV,ゲスト"
  },
  {
    title: "アンダーキッズ",
    url: "https://youtu.be/TBoBfT-_sfM?si=Qgd888185ov200x9",
    tag_list: "ツユ,MV,ゲスト"
  }
]

3.times do |n|
  post_info = guest_post_data[n]
  post = guest_user.posts.create!(
    title: post_info[:title],
    url: post_info[:url],
    comment: Faker::Lorem.sentence(word_count: 3),
    tag_list: post_info[:tag_list]
  )

  users = User.order(:created_at).take(n+3)
  users.each { |u| u.favorites.create!(user_id: guest_user.id, post_id: post.id) }
  target_post = Post.where.not(user_id: guest_user.id).order(:created_at).find(n+1)
  guest_user.favorites.create!(user_id: guest_user.id, post_id: target_post.id)
end
