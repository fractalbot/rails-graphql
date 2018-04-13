Types::CommentInputType = GraphQL::InputObjectType.define do
  name "CommentInputType"
  description "Properties to creating or updating a Comment"

  argument :comment, !types.String

end

Types::CommentType = GraphQL::ObjectType.define do
  name "CommentType"

  field :comment, !types.String

end