class EntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :name, :likes_count
  has_many :comments
  has_many :likes
end
