class EntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :name, :likes_count, :created_at, :updated_at
  has_many :comments
  has_many :likes
end
