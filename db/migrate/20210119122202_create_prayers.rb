class CreatePrayers < ActiveRecord::Migration[6.0]
  def change
    create_table :prayers do |t|
      t.boolean :prayed
      t.integer :entry_id
      t.integer :user_id

      t.timestamps
    end
  end
end
