# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do
#   author =  Author.create(first_name: Faker::Book.author, age: rand(18..80), is_alive: Faker::Boolean.boolean)
#   rand(1..10).times do
#     author.books << Book.create(name: Faker::Book.title)
#   end
# end


2.times do
  User.create(name: Faker::GameOfThrones.character, email: Faker::Internet.email, password:"12345", password_confirmation:"12345")
end

rand(1..10).times do
  post = Post.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user_id: User.all.sample)
  rand(10..30).times do
    post.comments << Comment.create(comment: Faker::Lorem.paragraph)
  end
end




