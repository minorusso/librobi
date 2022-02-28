class AddBookIsbnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :book, foreign_key: true
  end
end

