User.create!(name:  "Example User",
             email: "example@domain.org",
             password:              "foobar",
             password_confirmation: "foobar")

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@domain.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
2.times do
  title = Faker::Lorem.sentence(word_count: 5)
  url = "https://youtu.be/gcgKUcJKxIs?si=iIrAvDjdz5dKsZKG"
  comment = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.posts.create!(title: title, url: url, comment: comment) }
end

11.times do |n|
  users = User.order(:created_at).take(n+1)
  post = Post.find(n+1)
  users.each { |user| user.favorites.create!(user_id: user.id, post_id: post.id) }
end

