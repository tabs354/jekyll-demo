require 'faker'

5.times do
  name = Faker::JapaneseMedia::OnePiece.unique.character
  puts "User: #{name}"
  User.create(username: name,
              email: "#{name.delete(' ')}@example.com",
              password: "password")
end

5.times do
  island = Faker::JapaneseMedia::OnePiece.unique.island
  Category.create(name: island)
  puts "Category: #{island}"
end

20.times do
  title = Faker::JapaneseMedia::OnePiece.character
  Article.create(title: title,
                 description: Faker::JapaneseMedia::OnePiece.quote,
                 user_id: Faker::Number.within(range: 1..5))
  puts "Article: #{title}"
end

(1..20).each do | article_id |
  category_num = rand(1..5)
  random_category_id = Array(1..5).shuffle
  category_num.times do
    ArticleCategory.create(article_id: article_id, category_id: random_category_id.pop)
  end
end

user = User.first
user.toggle!(:admin)
user.save
puts "Admin: #{user.email} Password: password"