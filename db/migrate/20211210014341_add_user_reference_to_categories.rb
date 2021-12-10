class AddUserReferenceToCategories < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :categories, :users
    add_index :categories, :user_id
    change_column_null :categories, :user_id, false
  end
end
