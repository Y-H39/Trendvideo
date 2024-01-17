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
  "伏黒",
  "梅",
  "25",
  "鬼滅",
  "サンド",
  "リコリコ",
  "ミスチル",
  "呪術",
  "米津",
  "アイドル"
]
urls = [
  "https://youtu.be/gI9lbGJMFUI?si=V50PoEKK2FLd5d8t",
  "https://youtu.be/PWJzM6dnYFQ?si=JukeB6HDTtwewikO",
  "https://youtu.be/ODuMEKNXFWg?si=In2WE0geTGRs5hVi",
  "https://youtu.be/tLQLa6lM3Us?si=ecVba9ZcBdKsxy2n",
  "https://youtu.be/pwTIeEb48hg?si=2vQttfaYaxk2sC9G",
  "https://youtu.be/WIKKyrGGaDk?si=LZbjSNUoQtur7zDP",
  "https://youtu.be/Nxwt_s1lM04?si=N0-YK2pofziT7-P-",
  "https://youtu.be/gcgKUcJKxIs?si=9MkPB2kXwhTLziKt",
  "https://youtu.be/UFQEttrn6CQ?si=6--aXw4iXgm6w_y9",
  "https://youtu.be/ZRtdQ81jPUQ?si=Gto4eZVU2XVuUADY"
]
10.times do |n|
  user = User.order(:created_at).find(n+1)
  title = titles[n]
  url = urls[n]
  comment = Faker::Lorem.sentence(word_count: 5)
  user.posts.create!(title: title, url: url, comment: comment)

  users = User.order(:created_at).take(n+3)
  post = Post.find(n+1)
  users.each { |user| user.favorites.create!(user_id: user.id, post_id: post.id) }
end

guest_user = User.guest
3.times do |n|
  post = guest_user.posts.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    url: urls.sample,
    comment: Faker::Lorem.sentence(word_count: 5)
  )

  users = User.order(:created_at).take(n+3)
  users.each { |user| user.favorites.create!(user_id: guest_user.id, post_id: post.id) }
  target_post = Post.where.not(user_id: guest_user.id).order(:created_at).find(n+1)
  guest_user.favorites.create!(user_id: guest_user.id, post_id: target_post.id)
end
