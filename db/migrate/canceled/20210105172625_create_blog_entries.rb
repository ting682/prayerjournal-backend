class CreateBlogEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_entries do |t|
      t.text :content
      t.integer :user_id
      t.boolean :public, default: false
      t.integer :blog_id
      t.boolean :published, default: false
      t.string :image_url
      t.timestamps
    end
  end

end
