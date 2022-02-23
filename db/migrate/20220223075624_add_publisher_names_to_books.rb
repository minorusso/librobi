class AddPublisherNamesToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :publishername, :string
  end
end
