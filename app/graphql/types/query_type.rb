Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :user, Types::UserType do
    description "User by"
    argument :id, !types.ID
    resolve -> (root, args, ctx) {
      if ctx[:current_user].blank?
        raise GraphQL::ExecutionError.new("Authentication required")
      end
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

end

