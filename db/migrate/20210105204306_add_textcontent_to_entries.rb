class AddTextcontentToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :text_content, :text
  end
end
