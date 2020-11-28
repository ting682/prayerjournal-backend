class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :name
end
