User.create!(name:  "Example User",
             email: "example@domain.org",
             password:              "foobar",
             password_confirmation: "foobar")

9.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@domain.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

10.times do |n|
  user = User.order(:created_at).find(n+1)
  title = Faker::Lorem.sentence(word_count: 2)
  url = "https://youtu.be/gcgKUcJKxIs?si=iIrAvDjdz5dKsZKG"
  comment = Faker::Lorem.sentence(word_count: 5)
  user.posts.create!(title: title, url: url, comment: comment)

  users = User.order(:created_at).take(n+1)
  post = Post.find(n+1)
  users.each { |user| user.favorites.create!(user_id: user.id, post_id: post.id) }
end
