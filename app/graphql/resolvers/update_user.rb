class Resolvers::UpdateUser < GraphQL::Function
  
  argument :id, types.ID
  argument :name, !types.String
  argument :access_level, !types.Int
  
  type Types::UserType

  def call(_obj, args, ctx)
    raise GraphQL::ExecutionError.new("Access denied") if ctx[:current_user].blank?
    user = User.find(args[:id])
    user.try :update, args.to_h
    user
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end