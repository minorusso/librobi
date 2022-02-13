class AddForeignKeytoPost < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :posts, :books, column: :isbn , primary_key: :isbn
  end
end
