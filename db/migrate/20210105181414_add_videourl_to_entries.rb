class AddVideourlToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :video_url, :string
  end
end
