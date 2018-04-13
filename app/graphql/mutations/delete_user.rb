class Mutations::DeleteUser < GraphQL::Function
  argument :id, !types.ID

  type types.Boolean

  def call(obj, args, ctx)
    User.destroy(args[:id])
  end

end