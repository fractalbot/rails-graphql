Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :user, Types::UserType do
    description "User by"
    argument :id, !types.ID
    resolve -> (root, args, ctx) {
      User.find(args[:id])
    }
  end

  field :all_users, types[Types::UserType] do
    description "All users"
    resolve -> (root, args, ctx){
      User.all
    }
  end


end

