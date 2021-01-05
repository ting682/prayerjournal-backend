class AddImageurlToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :image_url, :string
  end
end
