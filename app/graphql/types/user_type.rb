Types::UserType = GraphQL::ObjectType.define do
  name "UserType"

  field :id, !types.ID
  field :name, !types.String
  field :email, !types.String
  field :is_admin, types.Boolean
  field :posts, types[Types::PostType]
  field :quant_posts, types.Int, "The quantity of posts" do
    resolve -> (obj, _, _) {
      obj.posts.count
    }
  end
  field :errors, types[types.String], "Reasons this object could not be saved" do
    resolve ->(obj,_,_){
      obj.errors.to_a
    }
  end
end