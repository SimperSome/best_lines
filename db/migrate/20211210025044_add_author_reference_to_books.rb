class AddAuthorReferenceToBooks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :books, :authors
    add_index :books, :author_id
    change_column_null :books, :author_id, false
  end
end
