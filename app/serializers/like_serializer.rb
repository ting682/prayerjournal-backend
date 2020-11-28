class LikeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :entry, :user_id
end
