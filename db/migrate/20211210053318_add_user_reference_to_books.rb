class AddUserReferenceToBooks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :books, :users
    add_index :books, :user_id
    change_column_null :books, :user_id, false
  end
end
