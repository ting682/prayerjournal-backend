class RemoveBlogFromLikes < ActiveRecord::Migration[6.0]
  def change
    remove_reference :likes, :blog, foreign_key: true
  end
end
