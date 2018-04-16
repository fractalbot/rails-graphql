Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :user, Types::UserType do
    description "User by"
    argument :id, !types.ID
    resolve -> (root, args, ctx) {
      raise GraphQL::ExecutionError.new("Authentication required") if ctx[:current_user].blank?
      User.find(args[:id])
    }
  end

  field :all_users, types[Types::UserType] do
    description "All users"
    resolve -> (root, args, ctx){
      raise GraphQL::ExecutionError.new("Authentication required") if ctx[:current_user].blank?
      User.all
    }
  end

  field :get_posts, types[Types::PostType] do
    description "All posts"
    resolve -> (root, args, ctx){
      raise GraphQL::ExecutionError.new("Authentication required") if ctx[:current_user].blank?
      Post.where(user_id: ctx[:current_user].id)
    }
  end

end

