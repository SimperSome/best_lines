class AddUserReferenceToBestLines < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :best_lines, :users
    add_index :best_lines, :user_id
    change_column_null :best_lines, :user_id, false
  end
end
