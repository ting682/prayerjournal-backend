class AddBlogToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :blog, foreign_key: true
  end
end
