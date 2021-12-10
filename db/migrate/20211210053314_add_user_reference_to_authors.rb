class AddUserReferenceToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :authors, :users
    add_index :authors, :user_id
    change_column_null :authors, :user_id, false
  end
end
