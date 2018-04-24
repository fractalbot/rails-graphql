Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'
  field :createUser, function: Resolvers::CreateUser.new
  field :signinUser, function: Resolvers::SignInUser.new
  field :createPost, function: Resolvers::CreatePost.new
  field :createComment, function: Resolvers::CreateComment.new
  field :updateUser, function: Resolvers::UpdateUser.new
end