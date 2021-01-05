class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.integer :user_id

      t.timestamps
    end
  end
end
