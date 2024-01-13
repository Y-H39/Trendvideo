FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 5) }
    url {"https://youtu.be/stzAsF51T_w?si=oGywli2yOqa2f-mX"}
    comment { Faker::Lorem.characters(number: 5) }
    user
  end
end
