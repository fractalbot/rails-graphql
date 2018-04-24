module PostsHelper
  def fetch_posts
    posts = $redis.get('posts')
    if posts.nil?
      posts = Post.all.to_json
      $redis.set('posts', posts)
      $redis.expire('posts', 60)
    end
    JSON.parse(posts, object_class: OpenStruct) # É necessário transformar em objeto para ser utilizado pelo Graphql
  end
end