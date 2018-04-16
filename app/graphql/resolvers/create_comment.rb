class Resolvers::CreateComment < GraphQL::Function
  argument :comment, !types.String
  argument :post_id, !types.ID

  type Types::CommentType

  def call(_obj, args, ctx)
    # raise GraphQL::ExecutionError.new("Authentication required") if ctx[:current_user].blank?

    Comment.create!(
      comment: args[:comment],
      post_id: args[:post_id]
    )
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end