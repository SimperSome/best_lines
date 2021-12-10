class AddBookReferenceToBestLines < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :best_lines, :books
    add_index :best_lines, :book_id
    change_column_null :best_lines, :book_id, false
  end
end
