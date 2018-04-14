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

  field :login, types.String do
    description "User login"
    argument :email, types.String
    argument :password, types.String
    resolve -> (_, args, _){
      user = User.where(email: args[:email]).first
      user.sessions.create.key if user.try(:authenticate, args[:password])
    }
  end

  field :current_user, Types::UserType do
    resolve -> (_, _, ctx){
      ctx[:current_user]
    }
  end


end

