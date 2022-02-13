class AddBookIsbnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :isbn, :bigint, index: true
  end
end

