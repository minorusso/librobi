class AddColumnBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :item_caption, :text
  end
end
