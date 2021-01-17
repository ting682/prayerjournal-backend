class BlogSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :image_url, :user_id, :created_at, :updated_at, :video_url, :published, :name
  
  has_many :entries
end
