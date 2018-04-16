class Resolvers::CreatePost < GraphQL::Function
  argument :title, !types.String
  argument :content, !types.String

  type Types::PostType

  def call(_obj, args, ctx)
    raise GraphQL::ExecutionError.new("Authentication required") if ctx[:current_user].blank?

    Post.create!(
      title: args[:title],
      content: args[:content],
      user_id: ctx[:current_user]&.id
    )
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end