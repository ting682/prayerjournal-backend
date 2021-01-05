class AddPublishedToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :published, :boolean, default: false
  end
end
