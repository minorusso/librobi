class AddBookIsbnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :book_isbn, :bigint
    add_foreign_key :posts, :books, column: :book_isbn , primary_key: :isbn
  end
end

