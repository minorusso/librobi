class AddBookIsbnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :isbn, :bigint
    add_foreign_key :posts, :books, column: :isbn , primary_key: :isbn
  end
end

