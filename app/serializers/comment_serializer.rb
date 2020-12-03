class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :name, :entry_id, :created_at, :updated_at
end
