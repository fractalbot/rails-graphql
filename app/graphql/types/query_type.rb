include PostsHelper
Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  
  field :user, Types::UserType do
    description "User by"
    argument :id, !types.ID
    guard ->(root, args, ctx) { 
      raise GraphQL::ExecutionError.new("Authentication required") if ctx[:current_user].blank?
      UserPolicy.new(ctx[:current_user], nil).user?
    }
    resolve -> (root, args, ctx) {
      User.find(args[:id])
    }
  end

  field :all_users, types[Types::UserType] do
    description "All users"
    guard ->(root, args, ctx) { 
      raise GraphQL::ExecutionError.new("Authentication required") if ctx[:current_user].blank?
      UserPolicy.new(ctx[:current_user], nil).all_users?
    }
    resolve -> (root, args, ctx){
      User.all
    }
  end

  connection :get_posts, Types::PostType.connection_type do
    description "All books"
    guard ->(root, args, ctx) { 
      raise GraphQL::ExecutionError.new("Authentication required") if ctx[:current_user].blank?
      PostPolicy.new(ctx[:current_user], nil).get_posts?
    }
    resolve -> (root, args, ctx){
      fetch_posts
    }
  end

end

