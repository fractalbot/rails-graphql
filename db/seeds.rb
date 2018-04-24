user = User.create(name: 'Gleydson Tavares', email: 'teste@email.com.br', password:"12345", password_confirmation:"12345")
10000.times do
  post = Post.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph)
  10.times do
    post.comments << Comment.create(comment: Faker::Lorem.paragraph)
  end
  user.posts << post
end







