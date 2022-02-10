class AddBookIsbnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :book
    add_foreign_key :posts, :books, column: :book_id , primary_key: :isbn
  end
end

