class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.boolean :liked

      t.timestamps
    end
  end
end
