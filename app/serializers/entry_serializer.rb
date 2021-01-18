class EntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :name, :likes_count, :created_at, :updated_at, :user_id, :public, :image_url, :text_content, :blog_id, :video_url, :published
  has_many :comments
  has_many :likes
  has_many :hashtags
end
