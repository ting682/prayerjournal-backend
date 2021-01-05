class AddBlogToEntry < ActiveRecord::Migration[6.0]
  def change
    add_reference :entries, :blog, foreign_key: true
  end
end
