class RemoveBlogFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_reference  :comments, :blog, foreign_key: true
  end
end
