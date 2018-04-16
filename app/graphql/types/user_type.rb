Types::UserType = GraphQL::ObjectType.define do
  name "UserType"

  field :id, !types.ID
  field :name, !types.String
  field :email, !types.String
  field :posts, types[Types::PostType]
  field :quant_posts, types.Int, "The quantity of posts" do
    resolve -> (obj, _, _) {
      obj.posts.count
    }
  end
end