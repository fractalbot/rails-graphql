Types::PostType = GraphQL::ObjectType.define do
  name "PostType"

  field :title, !types.String
  field :content, !types.String
  field :comments, types[Types::CommentType]
  field :quant_comments, types.Int, "The quantity of comments" do
    resolve ->(obj, _, _) {
      obj.comments.count
    }
  end
end