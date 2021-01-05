class DropBlogEntries < ActiveRecord::Migration[6.0]
  def change
    drop_table :blog_entries
  end
end
