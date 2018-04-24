Types::PostType = GraphQL::ObjectType.define do
  name "PostType"

  field :title, !types.String
  field :content, !types.String
  field :comments, types[Types::CommentType]
end