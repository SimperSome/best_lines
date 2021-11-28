class AddBookCountToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :books_count, :integer
  end
end
