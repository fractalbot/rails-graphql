Types::UserInputType = GraphQL::InputObjectType.define do
  name "UserInputType"
  description "Properties to creating or updating a User"

  argument :name, !types.String


end

Types::UserType = GraphQL::ObjectType.define do
  name "UserType"

  field :id, types.ID
  field :name, !types.String
  field :posts, types[Types::PostType]
  field :quant_posts, types.Int, "The quantity of posts" do
    resolve ->(obj, _, _) {
      obj.posts.count
    }
  end
end