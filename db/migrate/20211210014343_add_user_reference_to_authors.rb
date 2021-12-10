class AddUserReferenceToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :authors, :users
    add_index :authors, :user_id
  end
end
