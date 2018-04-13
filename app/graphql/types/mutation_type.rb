Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createUser, function: Mutations::CreateUser.new
  field :updateUser, function: Mutations::UpdateUser.new
  field :deleteUser, function: Mutations::DeleteUser.new
end
