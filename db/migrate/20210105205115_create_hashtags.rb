class CreateHashtags < ActiveRecord::Migration[6.0]
  def change
    create_table :hashtags do |t|
      t.string :keyword
      t.references :blog, foreign_key: true
      t.references :entry, foreign_key: true
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
