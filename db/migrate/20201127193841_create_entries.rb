class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.text :content
      t.integer :user_id
      t.boolean :public, default: false

      t.timestamps
    end
  end
end
