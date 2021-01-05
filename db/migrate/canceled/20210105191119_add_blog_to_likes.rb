class AddBlogToLikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :likes, :blog, foreign_key: true
  end
end
