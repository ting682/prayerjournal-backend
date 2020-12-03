class LikeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :entry_id, :user_id, :liked, :created_at, :updated_at
end
