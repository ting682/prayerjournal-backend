class AddVideourlToBlog < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :video_url, :string
  end
end
