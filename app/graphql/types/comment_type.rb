Types::CommentType = GraphQL::ObjectType.define do
  name "CommentType"
  field :comment, !types.String
  field :post_id, !types.ID
end