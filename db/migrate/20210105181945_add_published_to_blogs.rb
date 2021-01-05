class AddPublishedToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :published, :boolean, default: false
  end
end
